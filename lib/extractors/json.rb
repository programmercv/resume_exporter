require "json"
require "safe_yaml"
require "extractors/base"
require "extractors/json/json_resume"
require "extractors/json/fresh"
require "extractors/json/prtflio"

module Extractor
  class Json < Base
    def initialize(file_path)
      @doc = File.open(file_path) { |f| SafeYAML.load(f.read) }
    end

    def extract
      if is_prtflio?
        extractor = Extractor::Prtflio.new(@doc)
      elsif is_fresh?
        extractor = Extractor::Fresh.new(@doc)
      else
        extractor = Extractor::JsonResume.new(@doc)
      end

      attributes.reduce({}) do |hash, attr|
        hash[attr] = extractor.send(attr) if extractor.respond_to?(attr)
        hash
      end
    end

    def is_prtflio?
      @doc.dig("meta", "format") && 
        @doc.dig("meta", "format").downcase.include?("prtflio")
    end

    def is_fresh?
      @doc.dig("meta", "format") && 
        @doc.dig("meta", "format").downcase.include?("fresh")
    end
  end
end