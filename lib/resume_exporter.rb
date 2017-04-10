require "extractors/factory"
require "exporters/json"
require "exporters/xml"
require "exporters/md"
require "exporters/html"
require "exporters/pdf"
require "exporters/txt"
require "exporters/yaml"

class ResumeExporter
  def initialize(input)
    if input.is_a?(String) || input.is_a?(Pathname)
      # TODO: allow Json string
      @data = Extractor::Factory.extractor_for(input).extract
    elsif input.is_a?(Hash)
      @data = input
    end      
  end

  def export(options = {})
    format = options[:format] || "json"
    
    case format.downcase
    when "json"
      Exporter::Json.export(data: @data)
    when "fresh", "fresca"
      Exporter::Json.export(data: @data, template: "fresh")
    when "jsonresume", "json_resume", "json-resume"
      Exporter::Json.export(data: @data, template: "json_resume")
    when "xml"
      Exporter::Xml.export(data: @data)
    when "html"
      Exporter::Html.export(data: @data)
    when "pdf"
      Exporter::Pdf.export(data: @data)
    when "md"
      Exporter::Md.export(data: @data)
    when "yaml"
      Exporter::Yaml.export(data: @data)
    when "txt"
      Exporter::Txt.export(data: @data)
    when "hash"
      @data
    end
  end
end