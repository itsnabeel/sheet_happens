module SheetHappens
  class Report
    attr_accessor :collection

    def initialize(collection)
      @collection = collection
    end

    def execute
      @collection
    end

    def headers
      @collection.model.column_names
    end

    def results
      execute.map { |e| e.attributes.map { |f, v| format_field(f, v) } }
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

    def to_xls
      # code to turn SQL into XLS report using headers and results
    end

    def to_json(*_args)
      # code to turn SQL into JSON report using headers and results
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
