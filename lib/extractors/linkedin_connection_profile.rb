require "nokogiri"

module Extractor
  class LinkedinConnectionProfile
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
      @doc.at_css('#headline .title').text.gsub(/\s+/, ' ').strip if @doc.at_css('#headline .title')
    end

    def picture
      @doc.at_css('.profile-picture img')['src'] if @doc.at_css('.profile-picture img')
    end

    def location
      @doc.at_css('.locality').text if @doc.at_css('.locality')
    end

    def websites
      @doc.css('#website li a').map do |item|
        link = clean_up_linkedin_redirect_url(item['href'])
        { name: item.text, link: link }
      end
    end

    def summary
      @doc.at_css('.summary .description').text.gsub(/[[:space:]]/, ' ').strip if @doc.at_css('.summary .description')
    end

    def experience
      @doc.css('#background-experience .section-item').map do |item|
        experience = {}
        experience[:title] = item.at_css("header h4 a").text if item.at_css("header h4 a")
        experience[:company] = item.at_css("header h5 a").text if item.at_css("header h5 a")
        dates = item.css(".experience-date-locale time")
        experience[:start_date] = dates[0].text if dates[0]
        experience[:end_date] = dates[1].text if dates[1]
        experience[:end_date] ||= "Present"
        experience[:description] = item.at_css(".description").text if item.at_css(".description")
        experience[:location] = item.at_css(".locality").text if item.at_css(".locality")
        experience
      end
    end

    def certifications
      @doc.css('#background-certifications .section-item').map do |item|
        certification = {}
        certification[:name] = item.at_css("hgroup h4 a").text.gsub("(Link)", "") if item.at_css("hgroup h4 a")
        certification[:authority] = item.at_css("hgroup h5 a").text if item.at_css("hgroup h5 a")
        tmp = item.at_css("hgroup h5").text.gsub(/\s+/, ' ').strip.split(",") if item.at_css("hgroup h5")
        if tmp && tmp.length > 1
          certification[:number] = tmp[1][9..-1] if tmp[1] && tmp[1][0..8] == " License "
        end

        certification[:url] = clean_up_linkedin_redirect_url(item.at_css("hgroup h4 a")["href"]) if item.at_css("hgroup h4 a")
        dates = item.css(".certification-date time")
        certification[:start_date] = dates[0].text if dates[0]
        certification[:end_date] = dates[1].text if dates[1]
        certification[:end_date] ||= "Present"
        certification
      end
    end

    def education
      @doc.css('#background-education .section-item').map do |item|
        education = {}
        education[:school] = item.at_css("header h4 a").text if item.at_css("header h4 a")
        education[:degree] = item.at_css(".degree").text.strip.gsub(/,$/, "") if item.at_css(".degree")
        education[:field_of_study] = item.at_css(".major").text.strip.gsub(/,$/, "") if item.at_css(".major")
        education[:grade] = item.at_css(".grade").text.gsub(/^,/, "").strip if item.at_css(".grade")
        education[:activities_and_societies] = item.at_css(".activities a").text if item.at_css(".activities a")
        education[:description] = item.at_css(".notes").text if item.at_css(".notes")

        dates = item.css(".education-date time")
        education[:start_date] = dates[0].text.gsub(/[^0-9]/, "") if dates[0]
        education[:end_date] = dates[1].text.gsub(/[^0-9]/, "") if dates[1]
        education[:end_date] ||= "Present"
        education
      end
    end

    def interests
      @doc.css('#interests .interests-listing a').map do |item|
        { name: item.text }
      end
    end

    def skills
      @doc.css('#background-skills .skill-pill .endorse-item-name-text').map do |item|
        { name: item.text }
      end
    end

    def languages
      @doc.css('#background-languages .section-item').map do |item|
        language = {}
        language[:name] = item.at_css("h4 span").text if item.at_css("h4 span")
        language[:proficiency] = item.at_css(".languages-proficiency").text if item.at_css(".languages-proficiency")
        language
      end
    end

    def volunteer_experiences
      @doc.css('#background-volunteering .experience').map do |item|
        volunteering = {}
        volunteering[:role] = item.at_css("hgroup h4 span").text if item.at_css("hgroup h4 span")
        volunteering[:organization] = item.at_css("hgroup h5 a").text if item.at_css("hgroup h5 a")
        volunteering[:cause] = item.at_css(".locality").text if item.at_css(".locality")
        dates = item.css(".volunteering-date-cause time")
        volunteering[:start_date] = dates[0].text if dates[0]
        volunteering[:end_date] = dates[1].text if dates[1]
        volunteering[:end_date] ||= "Present"
        volunteering[:description] = item.at_css(".description").text if item.at_css(".description")
        volunteering
      end
    end

    def awards
      @doc.css('#background-honors .section-item').map do |item|
        award = {}
        award[:title] = item.at_css("h4 span").text if item.at_css("h4 span")
        award[:issuer] = item.at_css("h5 span").text if item.at_css("h5 span")
        award[:date] = item.at_css(".honors-date time").text if item.at_css(".honors-date time")
        award[:description] = item.at_css(".description").text if item.at_css(".description")
        award
      end
    end

    def courses
      @doc.css('#background-courses .section-item li').map do |item|
        course = {}
        course[:name] = item.at_css('text()').text.strip
        course[:number] = item.at_css('.courses-number').text.gsub(/[^0-9]/, "").strip
        course
      end
    end

    def organizations
      @doc.css('#background-organizations .section-item').map do |item|
        organization = {}
        organization[:organization] = item.at_css("h4 a").text if item.at_css("h4 a")
        organization[:position] = item.at_css("h5 span").text if item.at_css("h5 span")
        dates = item.css(".organizations-date time")
        organization[:start_date] = dates[0].text if dates[0]
        organization[:end_date] = dates[1].text if dates[1]
        organization[:end_date] ||= "Present"
        organization[:notes] = item.at_css(".description").text if item.at_css(".description")
        organization
      end
    end

    def test_scores
      @doc.css('#background-test-scores .section-item').map do |item|
        score = {}
        score[:name] = item.at_css("h4 span").text if item.at_css("h4 span")
        score[:score] = item.at_css("h5 span").text.gsub(/[^0-9]/, "") if item.at_css("h5 span")
        score[:description] = item.at_css(".description").text if item.at_css(".description")
        score[:date] = item.at_css(".test-scores-date time").text if item.at_css(".test-scores-date time")
        score
      end
    end

    def patents
      @doc.css('#background-patents .section-item').map do |item|
        patent = {}
        patent[:title] = item.at_css("h4 a span").text if item.at_css("h4 a span")
        patent[:url] = clean_up_linkedin_redirect_url(item.at_css("h4 a")["href"]) if item.at_css("h4 a")
        patent[:number] = item.at_css("h5 span").text.strip if item.at_css("h5 span")
        patent[:description] = item.at_css(".description").text if item.at_css(".description")
        patent[:date] = item.at_css(".patents-date").text.gsub("Issued", "").gsub("Filed", "").gsub(/[[:space:]]/, ' ').strip if item.at_css(".patents-date")
        patent  
      end
    end

    def projects
      @doc.css('#background-projects .section-item').map do |item|
        project = {}
        project[:name] = item.at_css("h4 a span").text if item.at_css("h4 a span")
        project[:url] = clean_up_linkedin_redirect_url(item.at_css("h4 a")["href"]) if item.at_css("h4 a")
        dates = item.css(".projects-date time")
        project[:start_date] = dates[0].text if dates[0]
        project[:end_date] = dates[1].text if dates[1]
        project[:end_date] ||= "Present"
        project[:description] = item.at_css(".description").text if item.at_css(".description")
        project  
      end
    end

    def publications
      @doc.css('#background-publications .section-item').map do |item|
        publication = {}
        publication[:title] = item.at_css("h4 a span").text if item.at_css("h4 a span")
        publication[:url] = clean_up_linkedin_redirect_url(item.at_css("h4 a")["href"]) if item.at_css("h4 a")
        publication[:publisher] = item.at_css("h5 span").text if item.at_css("h5 span")
        publication[:date] = item.at_css(".publication-date").text if item.at_css(".publication-date")
        publication[:description] = item.at_css(".description").text if item.at_css(".description")
        publication[:authors] = item.css(".associated-list li").map do |c|
          if c.at_css("h5 a")
            c.at_css("h5 a").text 
          elsif c.at_css("h6")
            c.at_css("h6").text
          end
        end.join(", ")

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
