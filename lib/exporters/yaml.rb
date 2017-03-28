require 'yaml'

module Exporter
  module Yaml
    def self.export(options = {})
      @data = options[:data]
      @data.to_yaml
    end
  end
end