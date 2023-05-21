module SheetHappens
  class Report
    attr_accessor :collection

    def initialize(collection, options = {})
      @collection = collection
      @options = options
    end

    def execute
      @collection
    end

    def headers
      if @options[:header_columns].present?
        @options[:header_columns].map { |h| h[:title] }
      else
        @collection.model.column_names
      end
    end

    def results
      if execute.is_a?(ActiveRecord::Relation)
        execute.map do |e|
          e.attributes.map do |f, v|
            format_field(f, v)
          end
        end
      elsif execute.is_a?(Array)
        execute.map do |e|
          e.map do |f, v|
            format_field(f, v)
          end
        end
      elsif execute.is_a?(Hash)
        execute.map do |f, v|
          format_field(f, v)
        end
      else
        []
      end
    end

    def format_header(header)
      header.titleize
    end

    def format_field(field, value)
      if respond_to?("format_#{field}")
        send("format_#{field}", value)
      else
        value
      end
    end

    def formatter
      @formatter ||= Class.new do
        include ActionView::Helpers::NumberHelper
        include ActionView::Helpers::UrlHelper
        def url_formatter
          @url_formatter ||= ActionController::Base.new.view_context
        end
      end.new
    end

    def to_html
      # code to turn SQL into HTML report using headers and results
    end

    def to_csv
      SheetHappens::CsvFormatter.new(self).to_csv
    end

    def to_pdf
      SheetHappens::PdfFormatter.new(self).to_pdf
    end

    def json(*_args)
      data = []
      headers_symbols = headers.map(&:to_sym)  # Convert headers to symbols for faster lookup

      results.each do |result|
        row = {}
        headers_symbols.each_with_index do |header, index|
          row[header] = result[index]
        end
        data << row
      end
      data.to_json
    end

    def method_missing(method_name, *args, &block)
      if /format_(.+)/.match?(method_name.to_s)
        args.first
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.start_with?('format_') || super
    end
  end
end
