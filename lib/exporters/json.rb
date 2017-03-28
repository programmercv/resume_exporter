require 'tilt/jbuilder.rb'
require 'multi_json'
MultiJson.use :yajl
MultiJson.dump_options = {:pretty=>true}
Jbuilder.key_format camelize: :lower


module Exporter
  module Json
    def self.export(options = {})
      template = options[:template] || "default"
      @data = options[:data]
      Tilt::JbuilderTemplate.new(File.expand_path("../templates/#{template}.json.jbuilder", __dir__)).render(self)
    end
  end
end