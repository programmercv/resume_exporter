require "nokogiri"
require "uri"

module Extractor
  class LinkedinPublicProfile
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

    def summary
      @doc.at_css('#summary .description').text.gsub(/[[:space:]]/, ' ').strip if @doc.at_css('#summary .description')
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

    def interests
      @doc.css('#interests .interest span').map do |item|
        { name: item.text }
      end
    end

    def skills
      @doc.css('#skills .skill a').map do |item|
        { name: item.text }
      end
    end

    def languages
      @doc.css('#languages .language').map do |item|
        language = {}
        language[:name] = item.at_css(".name").text if item.at_css(".name")
        language[:proficiency] = item.at_css(".proficiency").text if item.at_css(".proficiency")
        language
      end
    end

    def volunteer_experiences
      @doc.css('#volunteering .position').map do |item|
        volunteering = {}
        volunteering[:role] = item.at_css(".item-title").text if item.at_css(".item-title")
        volunteering[:organization] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
        volunteering[:cause] = item.at_css(".cause").text if item.at_css(".cause")
        dates = item.css(".date-range time")
        volunteering[:start_date] = dates[0].text if dates[0]
        volunteering[:end_date] = dates[1].text if dates[1]
        volunteering[:end_date] ||= "Present"
        volunteering[:description] = item.at_css(".description").text if item.at_css(".description")
        volunteering
      end
    end

    def awards
      @doc.css('#awards .award').map do |item|
        award = {}
        award[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
        award[:issuer] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
        award[:date] = item.at_css(".date-range time").text if item.at_css(".date-range time")
        award[:description] = item.at_css(".description").text if item.at_css(".description")
        award
      end
    end

    def courses
      @doc.css('#courses .course').map do |item|
        course = {}
        tmp = item.at_css("span").text.split(" (") if item.at_css("span")
        course[:name] = tmp[0]
        course[:number] = tmp[1].chomp(")") if tmp[1]
        course  
      end
    end

    def organizations
      @doc.css('#organizations li').map do |item|
        organization = {}
        organization[:organization] = item.at_css(".item-title").text if item.at_css(".item-title")
        organization[:position] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
        dates = item.css(".date-range time")
        organization[:start_date] = dates[0].text if dates[0]
        organization[:end_date] = dates[1].text if dates[1]
        organization[:end_date] ||= "Present"
        organization[:notes] = item.at_css(".description").text if item.at_css(".description")
        organization
      end
    end

    def test_scores
      @doc.css('#scores .score').map do |item|
        score = {}
        score[:name] = item.at_css(".item-title").text if item.at_css(".item-title")
        score[:score] = item.at_css(".item-subtitle").text.gsub(/[^0-9]/, "") if item.at_css(".item-subtitle")
        score[:description] = item.at_css(".description").text if item.at_css(".description")
        score  
      end
    end

    def patents
      @doc.css('#patents .patent').map do |item|
        patent = {}
        patent[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
        patent[:url] = clean_up_linkedin_redirect_url(item.at_css(".item-title a")["href"]) if item.at_css(".item-title a")
        patent[:number] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
        patent[:date] = item.at_css(".date-range time").text if item.at_css(".date-range time")
        patent[:description] = item.at_css(".description").text if item.at_css(".description")
        patent  
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

    def publications
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
