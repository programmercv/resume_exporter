require "nokogiri"
require "uri"

module Extractor
  class Linkedin
    def initialize(doc)
      @doc = doc
    end

    def basics
      {
        name: name,
        label: label,
        image: image,
        summary: summary,
        contact: {
          website: website,
          location: location
        }
      }
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

    def label
      @doc.at_css('.headline.title').text.gsub(/\s+/, ' ').strip if @doc.at_css('.headline.title')
    end

    def image
      @doc.at_css('.profile-picture img')['src'] if @doc.at_css('.profile-picture img')
    end

    def location
      @location ||= (@doc.at_css('.locality').text if @doc.at_css('.locality'))
    end

    def website
      link = @doc.at_css('.extra-info .websites li a')['href'] if @doc.at_css('.extra-info .websites li a')
      link = clean_up_linkedin_redirect_url(link) if link
    end

    def summary
      @doc.at_css('#summary .description').text.gsub(/[[:space:]]/, ' ').strip if @doc.at_css('#summary .description')
    end

    def employment
      {
        history: @doc.css('#experience .position').map do |item|
          experience = {}
          experience[:position] = item.at_css(".item-title").text if item.at_css(".item-title")
          experience[:employer] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
          dates = item.css(".date-range time")
          experience[:startDate] = dates[0].text if dates[0]
          experience[:endDate] = dates[1].text if dates[1]
          experience[:summary] = item.at_css(".description").text if item.at_css(".description")
          experience
        end
      }
    end

    def education
      {
        history: @doc.css('#education .school').map do |item|
          education = {}
          education[:institution] = item.at_css(".item-title").text if item.at_css(".item-title")

          subtitle = item.at_css(".item-subtitle span").text.split(", ") if item.at_css(".item-subtitle span")
          if subtitle && subtitle.length == 3
            education[:degree] = subtitle[0]
            education[:fieldOfStudy] = subtitle[1]
            education[:grade] = subtitle[2]
          elsif subtitle
            education[:fieldOfStudy] = subtitle
          end            

          item.css(".description p").map do |d|
            if !d.text.include?("Activities and Societies: ")
              education[:summary] = d.text
            end
          end

          dates = item.css(".date-range time")
          education[:startDate] = dates[0].text if dates[0]
          education[:endDate] = dates[1].text if dates[1]
          education
        end
      }
    end

    def projects
      {
        history: @doc.css('#projects .project').map do |item|
          project = {}
          project[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
          project[:url] = clean_up_linkedin_redirect_url(item.at_css(".item-title a")["href"]) if item.at_css(".item-title a")
          dates = item.css(".date-range time")
          project[:startDate] = dates[0].text if dates[0]
          project[:endDate] = dates[1].text if dates[1]
          project[:description] = item.at_css(".description").text if item.at_css(".description")
          project
        end
      }
    end

    def skills
      {
        sets: @doc.css('#skills .skill a').map do |item|
          { name: item.text }
        end
      }
    end

    def qualifications
      {
        history: [
          @doc.css('#certifications .certification').map do |item|
            certification = {}
            certification[:category] = "Certification"
            certification[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
            certification[:from] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
            certification[:url] = clean_up_linkedin_redirect_url(item.at_css(".item-title a")["href"]) if item.at_css(".item-title a")
            dates = item.css(".date-range time")
            certification[:startDate] = dates[0].text if dates[0]
            certification[:endDate] = dates[1].text if dates[1]
            certification
          end,

          @doc.css('#courses .course').map do |item|
            course = {}
            course[:category] = "Course"
            course[:title] = item.at_css("span").text
            course  
          end,

          @doc.css('#scores .score').map do |item|
            score = {}
            score[:category] = "Test Score"
            score[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
            # score[:score] = item.at_css(".item-subtitle").text.gsub(/[^0-9]/, "") if item.at_css(".item-subtitle")
            dates = item.css(".date-range time")
            score[:startDate] = dates[0].text if dates[0]
            score[:endDate] = dates[1].text if dates[1]
            score[:summary] = item.at_css(".description").text if item.at_css(".description")
            score  
          end
        ].flatten
      }
    end

    def recognition
      {
        history: @doc.css('#awards .award').map do |item|
          award = {}
          award[:category] = "Award"
          award[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
          award[:from] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
          dates = item.css(".date-range time")
          award[:startDate] = dates[0].text if dates[0]
          award[:endDate] = dates[1].text if dates[1]
          award[:summary] = item.at_css(".description").text if item.at_css(".description")
          award
        end
      }
    end

    def writing
      {
        history: @doc.css('#publications .publication').map do |item|
          publication = {}          
          publication[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
          publication[:url] = clean_up_linkedin_redirect_url(item.at_css(".item-title a")["href"]) if item.at_css(".item-title a")
          publication[:publisher] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
          publication[:date] = item.css(".date-range time").text if item.css(".date-range time")
          publication[:summary] = item.at_css(".description").text if item.at_css(".description")
          # publication[:authors] = item.css(".contributors .contributor").map { |c| c.text }.join("") if item.at_css(".contributors .contributor")
          publication
        end
      }
    end

    def patents
      {
        history: @doc.css('#patents .patent').map do |item|
          patent = {}
          patent[:title] = item.at_css(".item-title").text if item.at_css(".item-title")
          patent[:url] = clean_up_linkedin_redirect_url(item.at_css(".item-title a")["href"]) if item.at_css(".item-title a")
          patent[:date] = item.at_css(".date-range time").text if item.at_css(".date-range time")
          patent[:status] = item.at_css(".date-range").children.reject{|e| e.name == "time" }.map(&:text).join().strip if item.at_css(".date-range")
          patent[:description] = item.at_css(".description").text if item.at_css(".description")
          patent  
        end
      }
    end

    def languages
      {
        list: @doc.css('#languages .language').map do |item|
          language = {}
          language[:language] = item.at_css(".name").text if item.at_css(".name")
          language[:level] = item.at_css(".proficiency").text if item.at_css(".proficiency")
          language
        end
      }
    end

    def interests
      {
        list: @doc.css('#interests .interest span').map do |item|
          { name: item.text }
        end
      }
    end

    def affiliations
      {
        history: @doc.css('#organizations li').map do |item|
          organization = {}
          organization[:organization] = item.at_css(".item-title").text if item.at_css(".item-title")
          organization[:roles] = [item.at_css(".item-subtitle").text] if item.at_css(".item-subtitle")
          dates = item.css(".date-range time")
          organization[:startDate] = dates[0].text if dates[0]
          organization[:endDate] = dates[1].text if dates[1]
          organization[:summary] = item.at_css(".description").text if item.at_css(".description")
          organization
        end
      }
    end

    def service
      {
        history: @doc.css('#volunteering .position').map do |item|
          volunteering = {}
          volunteering[:category] = "Volunteer Work"
          volunteering[:roles] = [item.at_css(".item-title").text] if item.at_css(".item-title")
          volunteering[:organization] = item.at_css(".item-subtitle").text if item.at_css(".item-subtitle")
          # volunteering[:cause] = item.at_css(".cause").text if item.at_css(".cause")
          dates = item.css(".date-range time")
          volunteering[:startDate] = dates[0].text if dates[0]
          volunteering[:endDate] = dates[1].text if dates[1]
          volunteering[:summary] = item.at_css(".description").text if item.at_css(".description")
          volunteering
        end
      }
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
