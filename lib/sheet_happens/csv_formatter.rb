require 'csv'

module SheetHappens
  class CsvFormatter
    attr_reader :report

    def initialize(report)
      @report = report
    end

    def to_csv
      CSV.generate(headers: true) do |csv|
        csv << report.headers
        report.results.each do |result|
          csv << result
        end
      end
    end
  end
end
