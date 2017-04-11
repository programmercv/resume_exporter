require 'tilt'
require 'liquid'
require "base64"
require "open-uri"

module Base64Filter
  def encode64(input)
    begin
      image = open(input) {|f| f.read }
      base64 = Base64.encode64(image)
      ext = File.extname(input).strip.downcase[1..-1]
      out = "data:image/#{ext};base64,#{base64}"
    rescue 
      input
    end
  end
end

module Exporter
  module Html
    def self.export(options = {})
      template = options[:template] || "default"
      template_path = File.expand_path("../templates/html/#{template}.liquid", __dir__)
      template_dir = File.dirname(template_path)

      @data = options[:data]
      Liquid::Template.file_system = Liquid::LocalFileSystem.new(template_dir)
      Liquid::Template.register_filter(Base64Filter)
      Tilt.new(template_path).render(self, { "site" => { "data" => { "resume" => @data }}})
    end
  end
end