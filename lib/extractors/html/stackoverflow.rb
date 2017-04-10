require "nokogiri"
require "uri"

module Extractor
  class Stackoverflow
    def initialize(doc)
      @doc = doc
    end

    def basics
      {
        "name" => name,
        "label" => label,
        "image" => image,
        "contact" => {
          "website" => website,
          "location" => location
        }
      }
    end

    def name
      @doc.at_css('#section-personal h1').text if @doc.at_css('#section-personal h1')
    end

    def label
      @doc.at_css('#currently-at-container .job').text.gsub(/\s+/, ' ').strip if @doc.at_css('#currently-at-container .job')
    end

    def image
      @doc.at_css('.avatar img')['src'] if @doc.at_css('.avatar img')
    end

    def location
      @doc.at_css('.meta').children.reject{|e| e.name == "a" }.map(&:text).join().gsub(/\s+/, ' ').strip if @doc.at_css('.meta')
    end

    def website
      @doc.at_css('.meta a').text.strip if @doc.at_css('.meta a')
    end

    def employment
      @doc.css('#cv-Experience .cv-section').map do |item|
        experience = {}
        experience["position"] = item.at_css(".preview h3").children.reject{|e| e.name == "span" }.map(&:text).join().gsub(/\s+/, ' ').strip if item.at_css(".preview h3")
        experience["employer"] = item.at_css(".preview h3 .location").text.gsub(/\s+/, ' ').strip if item.at_css(".preview h3 .location")
        dates = item.at_css('.time-frame').text.gsub(/\s+/, ' ').strip.split(" → ") if item.at_css('.time-frame')
        experience["startDate"] = dates[0] if dates && dates[0]
        experience["endDate"] = dates[1] if dates && dates[1]
        experience["keywords"] = item.css(".timeline-item-tags .post-tag").map(&:text) if item.at_css(".timeline-item-tags .post-tag")
        experience["summary"] = item.at_css(".description").text.gsub(/\s+/, ' ').strip if item.at_css(".description")
        experience
      end
    end

    def education
      @doc.css('#cv-Education .cv-section').map do |item|
        education = {}
        education["institution"] = item.at_css(".preview h3 .location").text.gsub(/\s+/, ' ').strip if item.at_css(".preview h3 .location")
        education["degree"] = item.at_css(".preview h3").children.reject{|e| e.name == "span" }.map(&:text).join().gsub(/\s+/, ' ').strip.gsub(/[,]?$/, '') if item.at_css(".preview h3")
        education["summary"] = item.at_css(".description").text.gsub(/\s+/, ' ').strip if item.at_css(".description")
        dates = item.at_css('.time-frame').text.gsub(/\s+/, ' ').strip.split(" → ") if item.at_css('.time-frame')
        education["startDate"] = dates[0] if dates && dates[0]
        education["endDate"] = dates[1] if dates && dates[1]
        education["keywords"] = item.css(".timeline-item-tags .post-tag").map(&:text) if item.at_css(".timeline-item-tags .post-tag")
        education
      end
    end

    def projects
      @doc.css('#cv-Apps\ \&\ Software .cv-section').map do |item|
        project = {}
        project["title"] = item.at_css(".preview h3").text.gsub(/\s+/, ' ').strip if item.at_css(".preview h3")
        project["url"] = item.at_css(".preview h3 a")["href"] if item.at_css(".preview h3 a")
        dates = item.at_css('.time-frame').text.gsub(/\s+/, ' ').strip.split(" → ") if item.at_css('.time-frame')
        project["startDate"] = dates[0] if dates && dates[0]
        project["endDate"] = dates[1] if dates && dates[1]
        project["summary"] = item.at_css(".description").text.gsub(/\s+/, ' ').strip if item.at_css(".description")
        project["keywords"] = item.css(".timeline-item-tags .post-tag").map(&:text) if item.at_css(".timeline-item-tags .post-tag")
        project
      end
    end

    def qualifications
      @doc.css('#cv-Certifications .cv-section').map do |item|
        certification = {}
        certification["category"] = "Certificate"
        certification["title"] = item.at_css(".preview h3").text.gsub(/\s+/, ' ').strip if item.at_css(".preview h3")
        dates = item.at_css('.time-frame').text.gsub(/\s+/, ' ').strip.split(" → ") if item.at_css('.time-frame')
        certification["startDate"] = dates[0] if dates && dates[0]
        certification["endDate"] = dates[1] if dates && dates[1]
        certification["keywords"] = item.css(".timeline-item-tags .post-tag").map(&:text) if item.at_css(".timeline-item-tags .post-tag")
        certification
      end
    end

    def openSource
      @doc.css('#cv-Open\ Source .cv-section').map do |item|
        project = {}
        project["title"] = item.at_css(".preview h3").text.gsub(/\s+/, ' ').strip if item.at_css(".preview h3")
        project["repo"] = item.at_css(".preview h3 a")["href"] if item.at_css(".preview h3 a")
        dates = item.at_css('.time-frame').text.gsub(/\s+/, ' ').strip.split(" → ") if item.at_css('.time-frame')
        project["startDate"] = dates[0] if dates && dates[0]
        project["endDate"] = dates[1] if dates && dates[1]
        project["summary"] = item.at_css(".description").text.gsub(/\s+/, ' ').strip if item.at_css(".description")
        project["keywords"] = item.css(".timeline-item-tags .post-tag").map(&:text) if item.at_css(".timeline-item-tags .post-tag")
        project
      end
    end
  end
end
