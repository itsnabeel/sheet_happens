# require 'prawn'

# module SheetHappens
#   class PdfFormatter
#     attr_reader :report

#     def initialize(report)
#       @report = report
#     end

#     def to_pdf
#       Prawn::Document.generate('report.pdf') do |pdf|
#         pdf.font_size 12
#         pdf.text 'Report', align: :center, size: 16, style: :bold
#         pdf.move_down 20

#         pdf.table(report.results.insert(0, report.headers)) do
#           row(0).font_style = :bold
#           self.header = true
#         end
#       end
#     end
#   end
# end

require 'prawn'
require 'prawn/table'

module SheetHappens
  class PdfFormatter
    attr_reader :report

    def initialize(report)
      @report = report
    end

    def to_pdf
      pdf = Prawn::Document.new
      table_data = report.results.insert(0, report.headers)
      pdf.table(table_data, header: true, width: pdf.bounds.width) do |t|
        t.row(0).font_style = :bold
        t.row(0).background_color = 'dddddd'
        t.cells.padding = 12
        t.cells.borders = [:bottom]
        t.cells.border_width = 0.5
        t.cells.border_color = 'dddddd'
      end

      pdf.render
    end
  end
end
