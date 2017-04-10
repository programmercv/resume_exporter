require "exporters/html"
require "pdfkit"

module Exporter
  module Pdf
    def self.export(options = {})
      @data = options[:data]
      html = Exporter::Html.export(data: @data)
      kit = PDFKit.new(html, :page_size => 'Letter', :print_media_type => true)
      kit.to_pdf
    end
  end
end