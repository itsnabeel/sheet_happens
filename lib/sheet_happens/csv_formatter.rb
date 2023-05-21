require 'csv'

module SheetHappens
  class CsvFormatter
    attr_reader :report

    def initialize(report)
      @report = report
    end

    def to_csv
      CSV.generate(headers: true) do |csv|
        puts "headers: #{report.headers}"
        csv << report.headers
        puts "results: #{report.results}"
        report.results.each do |result|
          csv << result
        end
      end
    end
  end
end
