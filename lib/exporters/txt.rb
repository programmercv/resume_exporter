require 'tilt'
require 'erb'

module Exporter
  module Txt
    def self.export(options = {})
      @data = options[:data]
      Tilt.new(File.expand_path("lib/templates/default.txt.erb")).render(self)
    end
  end
end