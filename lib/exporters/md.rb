require 'tilt'
require 'erb'

module Exporter
  module Md
    def self.export(options = {})
      @data = options[:data]
      Tilt.new(File.expand_path("../templates/default.md.erb", __dir__)).render(self)
    end
  end
end