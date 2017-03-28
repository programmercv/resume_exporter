require "extractors/html"
require "extractors/json"

module Extractor
  module Factory
    def self.extractor_for(file_path)
      if File.file?(file_path)
        case File.extname(file_path)
        when ".html", ".htm"
          Extractor::Html.new(file_path)
        when ".json"
          Extractor::Json.new(file_path)
        else
          raise "File type not supported. Only .html or .json"
        end
      else
        raise "File not found"
      end
    end
  end
end