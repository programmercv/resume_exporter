require "nokogiri"
require "uri"

module Extractor
  class Stackoverflow
    def initialize(doc)
      @doc = doc
    end

    def name
      "#{first_name} #{last_name}" if first_name || last_name
    end

    def first_name
      @doc.at_css('#name').text.strip.split(' ', 2)[0].strip if @doc.at_css('#name')
    end

    def last_name
      @doc.at_css('#name').text.strip.split(' ', 2)[1].strip if @doc.at_css('#name')
    end

    def title
      @doc.at_css('.headline.title').text.gsub(/\s+/, ' ').strip if @doc.at_css('.headline.title')
    end

    def picture
      @doc.at_css('.profile-picture img')['data-delayed-url'] if @doc.at_css('.profile-picture img')
    end

    def location
      @location ||= (@doc.at_css('.locality').text if @doc.at_css('.locality'))
    end

    def websites
      @doc.css('.extra-info .websites li a').map do |item|
        link = clean_up_linkedin_redirect_url(item['href'])
        { name: item.text, link: link }
      end
    end

    def experience
      @doc.css('#experience .position').map do |item|
        experience = {}
        experience[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
        experience[:company] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
        dates = item.css(".date-range time")
        experience[:start_date] = dates[0].text if dates[0]
        experience[:end_date] = dates[1].text if dates[1]
        experience[:end_date] ||= "Present"
        experience[:description] = item.at_css(".description").text if item.at_css(".description")
        experience
      end
    end

    def certifications
      @doc.css('#certifications .certification').map do |item|
        certification = {}
        certification[:name] = item.at_css(".item-title").text if item.at_css(".item-title")

        tmp = item.at_css(".item-subtitle").text.split(",") if item.at_css(".item-subtitle")

        if tmp && tmp.length > 1
          certification[:authority] = tmp[0]
          certification[:number] = tmp[1][9..-1] if tmp[1] && tmp[1][0..8] == " License "
        end

        certification[:url] = clean_up_linkedin_redirect_url(item.at_css(".item-title a")["href"]) if item.at_css(".item-title a")
        dates = item.css(".date-range time")
        certification[:start_date] = dates[0].text if dates[0]
        certification[:end_date] = dates[1].text if dates[1]
        certification[:end_date] ||= "Present"
        certification
      end
    end

    def education
      @doc.css('#education .school').map do |item|
        education = {}
        education[:school] = item.at_css(".item-title").text if item.at_css(".item-title")

        subtitle = item.at_css(".item-subtitle span").text.split(", ") if item.at_css(".item-subtitle span")
        if subtitle && subtitle.length == 3
          education[:degree] = subtitle[0]
          education[:field_of_study] = subtitle[1]
          education[:grade] = subtitle[2]
        end

        item.css(".description p").map do |d|
          if d.text.include?("Activities and Societies: ")
            education[:activities_and_societies] = d.text[26..-1]
          else
            education[:description] = d.text
          end
        end

        dates = item.css(".date-range time")
        education[:start_date] = dates[0].text if dates[0]
        education[:end_date] = dates[1].text if dates[1]
        education[:end_date] ||= "Present"
        education
      end
    end

    def technologies
      @doc.css('#interests .interest span').map do |item|
        { name: item.text }
      end
    end

    def projects
      @doc.css('#projects .project').map do |item|
        project = {}
        project[:name] = item.at_css(".item-title").text if item.at_css(".item-title")
        project[:url] = clean_up_linkedin_redirect_url(item.at_css(".item-title a")["href"]) if item.at_css(".item-title a")
        dates = item.css(".date-range time")
        project[:start_date] = dates[0].text if dates[0]
        project[:end_date] = dates[1].text if dates[1]
        project[:end_date] ||= "Present"
        project[:description] = item.at_css(".description").text if item.at_css(".description")
        project
      end
    end

    def open_source_projects
      @doc.css('#publications .publication').map do |item|
        publication = {}
        publication[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
        publication[:url] = clean_up_linkedin_redirect_url(item.at_css(".item-title a")["href"]) if item.at_css(".item-title a")
        publication[:publisher] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
        publication[:date] = item.css(".date-range time").text if item.css(".date-range time")
        publication[:description] = item.at_css(".description").text if item.at_css(".description")
        publication[:authors] = item.css(".contributors .contributor").map { |c| c.text }.join("") if item.at_css(".contributors .contributor")
        publication
      end
    end

    private
      def clean_up_linkedin_redirect_url(link)
        if link && link.include?("/redir/redirect")
          uri = URI(link) if link
          query = uri.query if uri
          params = query.split("&") if query
          url = params.select{|s| s.include?("url=")}.first if params
          url = url.gsub("url=", "") if url
          url = URI.unescape(url) if url
          link = url if url
        end

        link
      end
  end
end
