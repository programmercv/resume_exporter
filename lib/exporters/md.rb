require 'tilt'
require 'erb'

module Exporter
  module Md
    def self.export(options = {})
      @data = options[:data]
      Tilt.new(File.expand_path("lib/templates/default.md.erb")).render(self)
    end
  end
end