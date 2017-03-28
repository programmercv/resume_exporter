require 'tilt'
require 'builder'

module Exporter
  module Xml
    def self.export(options = {})
      template = options[:template] || "prtflio"
      @data = options[:data]
      Tilt.new(File.expand_path("lib/templates/#{template}.xml.builder")).render(self)
    end
  end
end