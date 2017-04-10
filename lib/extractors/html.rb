require "nokogiri"
require "extractors/base"
require "extractors/html/linkedin"
require "extractors/html/stackoverflow"
require "extractors/html/xing"

module Extractor
  class Html < Base
    def initialize(file_path)
      @doc = File.open(file_path) { |f| Nokogiri::HTML(f, nil, 'utf-8') }
    end

    def extract
      if is_linkedin?
        extractor = Extractor::Linkedin.new(@doc)
      elsif is_xing?
        extractor = Extractor::Xing.new(@doc)
      elsif is_stackoverflow?
        extractor = Extractor::Stackoverflow.new(@doc)
      end

      attributes.reduce({}) do |hash, attr|
        hash[attr] = extractor.send(attr) if extractor.respond_to?(attr)
        hash
      end
    end

    def is_linkedin?
      @doc.css("link").any?{|s| s["href"].include?("licdn.com") }
    end

    def is_xing?
      @doc.css("link").any?{|s| s["href"].include?("xing.com") }
    end

    def is_stackoverflow?
      @doc.css("link").any?{|s| s["href"].include?("sstatic.net") }
    end
  end
end