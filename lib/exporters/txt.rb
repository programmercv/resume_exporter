require 'tilt'
require 'erb'

module Exporter
  module Txt
    def self.export(options = {})
      @data = options[:data]
      Tilt.new(File.expand_path("../templates/default.txt.erb", __dir__)).render(self)
    end
  end
end