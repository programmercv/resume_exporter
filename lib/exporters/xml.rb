require 'tilt'
require 'builder'

module Exporter
  module Xml
    def self.export(options = {})
      template = options[:template] || "prtflio"
      @data = options[:data]
      Tilt.new(File.expand_path("../templates/#{template}.xml.builder", __dir__)).render(self)
    end
  end
end