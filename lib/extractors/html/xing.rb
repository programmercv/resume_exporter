require "nokogiri"
require "uri"

module Extractor
  class Xing
    def initialize(doc)
      @doc = doc
    end

    def basics
      {
        "name" => name,
        "image" => image
      }
    end

    def name
      @doc.at_css('.user-name').text.strip if @doc.at_css('.user-name')
    end

    def image
      @doc.at_css('img.user-image')['src'] if @doc.at_css('img.user-image')
    end

    def employment
      @doc.css('#work-experience li').map do |item|
        experience = {}
        experience["position"] = item.at_css(".job-title").text if item.at_css(".job-title")
        experience["employer"] = item.at_css(".job-company-name").text.gsub(/\s+/, ' ').strip if item.at_css(".job-company-name")
        experience["url"] = item.at_css(".company-url a")["href"] if item.at_css(".company-url a")
        dates = item.css(".additional.top").text.gsub(/\s+/, ' ').strip.split(" - ")
        experience["startDate"] = dates[0] if dates[0]
        experience["endDate"] = dates[1] if dates[1]
        experience["endDate"] ||= "Present"
        experience
      end
    end

    def education
      @doc.css('#education .item-list li').map do |item|
        education = {}
        education["institution"] = item.at_css(".education-title").text if item.at_css(".education-title")
        education["fieldOfStudy"] = item.at_css(".education-description").text.gsub(/\s+/, ' ').strip if item.at_css(".education-description")
        education["summary"] = item.at_css(".meta").text.gsub(/\s+/, ' ').strip if item.at_css(".meta")

        dates = item.css(".additional.top").text.gsub(/\s+/, ' ').strip.split(" - ")
        education["startDate"] = dates[0] if dates[0]
        education["endDate"] = dates[1] if dates[1]
        education["endDate"] ||= "Present"
        education
      end
    end

    def languages
      @doc.css('#language-skills .language').map do |item|
        language = {}
        language["language"] = item.at_css("h3 text()").text.gsub(/\s+/, ' ').strip if item.at_css("h3")
        language["level"] = item.at_css(".language-level-name").text.gsub(/[()]/, "") if item.at_css(".language-level-name")
        language
    end
    end

    def qualifications
      @doc.css('#qualifications li .title').map do |item|
        { "title" => item.text.gsub(/\s+/, ' ').strip }
      end
    end

    def recognition
      @doc.css('#awards li').map do |item|
        award = {}
        award["title"] = item.at_css(".title text()").text.gsub(/\s+/, ' ').strip if item.at_css(".title")
        award["startDate"] = item.at_css(".additional.top").text if item.at_css(".additional.top")
        award["url"] = item.at_css(".additional a")["href"] if item.at_css(".additional a")
        award
      end
    end

    def affiliation
      @doc.css('#organizations li .title').map do |item|
        { "organization" => item.text.gsub(/\s+/, ' ').strip }
      end
    end

    def interests
      @doc.css('#interests li').map do |item|
        { "name" => item.text.gsub(/\s+/, ' ').strip }
      end
    end
  end
end
