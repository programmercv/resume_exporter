require "nokogiri"
require "uri"

module Extractor
  class Xing
    def initialize(doc)
      @doc = doc
    end

    def name
      "#{first_name} #{last_name}" if first_name || last_name
    end

    def first_name
      @doc.at_css('.user-info .username').text.strip.split(' ', 2)[0].strip if @doc.at_css('.user-info .username')
    end

    def last_name
      @doc.at_css('.user-info .username').text.strip.split(' ', 2)[1].strip if @doc.at_css('.user-info .username')
    end

    def title
      @doc.at_css('.user-info .title').text.gsub(/\s+/, ' ').strip if @doc.at_css('.user-info .title')
    end

    def picture
      @doc.at_css('img.user-image')['src'] if @doc.at_css('img.user-image')
    end

    def experience
      @doc.css('.work-experience-list .work-experience').map do |item|
        experience = {}
        experience[:title] = item.at_css(".job-title").text if item.at_css(".job-title")
        experience[:company] = item.at_css(".job-company-name").text.gsub(/\s+/, ' ').strip if item.at_css(".job-company-name")
        dates = item.css(".date-range").text.gsub(/\s+/, ' ').strip.split(" - ")
        experience[:start_date] = dates[0] if dates[0]
        experience[:end_date] = dates[1] if dates[1]
        experience[:end_date] ||= "heute"
        experience
      end
    end

    def education
      @doc.css('.education li').map do |item|
        education = {}
        education[:school] = item.at_css(".education-title").text if item.at_css(".education-title")
        education[:description] = item.at_css(".education-description").text.gsub(/\s+/, ' ').strip if item.at_css(".education-description")

        dates = item.css(".date-range").text.gsub(/\s+/, ' ').strip.split(" - ")
        education[:start_date] = dates[0] if dates[0]
        education[:end_date] = dates[1] if dates[1]
        education[:end_date] ||= "heute"
        education
      end
    end

    def interests
      @doc.css('#interests li').map do |item|
        { name: item.text.gsub(/\s+/, ' ').strip }
      end
    end

    def languages
      @doc.css('#language-skills .language').map do |item|
        language = {}
        language[:name] = item.at_css(".language-name text()").text.gsub(/\s+/, ' ').strip if item.at_css(".language-name")
        language[:proficiency] = item.at_css(".language-level").text.gsub(/[()]/, "") if item.at_css(".language-level")
        language
      end
    end
  end
end
