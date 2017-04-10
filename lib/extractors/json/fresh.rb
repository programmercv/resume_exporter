module Extractor
  class Fresh
    def initialize(doc)
      @doc = doc
    end

    def meta
      {
        "format" => @doc.dig("meta", "format"),
        "version" => @doc.dig("meta", "version")
      }
    end

    def basics
      {
        "name" => @doc.dig("name"),
        "label" => @doc.dig("info", "label"),
        "image" => @doc.dig("info", "image"),
        "summary" => @doc.dig("info", "brief"),
        "characterClass" => @doc.dig("info", "characterClass"),
        "quote" => @doc.dig("info", "quote"),
        "contact" => {
          "email" => @doc.dig("contact", "email"),
          "phone" => @doc.dig("contact", "phone"),
          "website" => @doc.dig("contact", "website"),
          "location" => @doc.dig("location", "address"),
          "other" => @doc.dig("contact", "other"),
          "social" => @doc.dig("social").map do |social|
            {
              "network" => social["network"],
              "user" => social["user"],
              "label" => social["label"],
              "url" => social["url"]
            }
          end
        }
      }
    end

    def employment
      @doc.dig("employment", "history").map do |job|
        {
          "employer" => job["employer"],
          "position" => job["position"],
          "url" => job["url"],
          "startDate" => job["start"],
          "endDate" => job["end"],
          "summary" => job["summary"],
          "location" => job["location"],
          "highlights" => job["highlights"],
          "keywords" => job["keywords"]
        }
      end
    end

    def education
      @doc.dig("education", "history").map do |education|
        {            
          "title" => education["title"],
          "institution" => education["institution"],
          "fieldOfStudy" => education["area"],
          "degree" => education["studyType"],
          "startDate" => education["start"],
          "endDate" => education["end"],
          "grade" => education["grade"],
          "url" => education["url"],
          "summary" => education["summary"],
          "location" => education["location"],
          "curriculum" => education["curriculum"],
          "highlights" => education["highlights"],
          "keywords" => education["keywords"]
        }
      end
    end

    def projects
      @doc.dig("projects").map do |project|
        {
          "title" => project["title"],
          "description" => project["description"],
          "url" => project["url"],
          "repo" => project["repo"],
          "startDate" => project["start"],
          "endDate" => project["end"],
          "roles" => [project["role"]],
          "category" => project["category"],
          "summary" => project["summary"],
          "media" => project["media"],
          "highlights" => project["highlights"],
          "keywords" => project["keywords"]
        }
      end
    end

    def skills
      @doc.dig("skills", "sets").map do |skill|
        {
          "name" => skill["name"],
          "level" => skill["level"],
          "keywords" => skill["skills"]
        }
      end
    end

    def recognition
      @doc.dig("recognition").map do |recognition|
        {
          "category" => recognition["category"],
          "title" => recognition["title"],
          "startDate" => recognition["date"],
          "from" => recognition["from"],
          "summary" => recognition["summary"],
          "url" => recognition["url"]
        }
      end
    end

    def writing
      @doc.dig("writing").map do |writing|
        {
          "title" => writing["title"],
          "category" => writing["category"],
          "publisher" => ( writing["publisher"].is_a?(Hash) ? writing.dig("publisher", "name") : writing["publisher"] ),
          "date" => writing["date"],
          "url" => writing["url"],
          "summary" => writing["summary"]
        }
      end
    end

    def reading
      @doc.dig("reading").map do |reading|
        {
          "title" => reading["title"],
          "category" => reading["category"],
          "url" => reading["url"],
          "author" => ( reading["author"].is_a?(Array) ? reading["author"].join(", ") : reading["author"] ),
          "date" => reading["date"],
          "summary" => reading["summary"]
        }
      end
    end

    def speaking
      @doc.dig("speaking").map do |speaking|
        {
          "title" => speaking["title"],
          "event" => speaking["event"],
          "location" => speaking["location"],
          "date" => speaking["date"],
          "summary" => speaking["summary"],
          "keywords" => speaking["keywords"],
          "highlights" => speaking["highlights"]
        }
      end
    end

    def languages
      @doc.dig("languages").map do |language|
        {
          "language" => language["language"],
          "level" => language["level"],
          "years" => language["years"]
        }
      end
    end

    def interests
      @doc.dig("interests").map do |interest|
        {
          "name" => interest["name"],
          "keywords" => interest["keywords"],
          "summary" => interest["summary"]
        }
      end
    end

    def extracurriculars
      @doc.dig("extracurricular").map do |extracurricular|
        {
          "title" => extracurricular["title"],
          "summary" => extracurricular["activity"],
          "location" => extracurricular["location"],
          "startDate" => extracurricular["start"],
          "endDate" => extracurricular["end"]
        }
      end
    end

    def affiliations
      @doc.dig("affiliation", "history").map do |affiliation|
        {
          "category" => affiliation["category"],
          "organization" => affiliation["organization"],
          "roles" => [affiliation["role"]],
          "url" => affiliation["url"],
          "startDate" => affiliation["start"],
          "endDate" => affiliation["end"],
          "summary" => affiliation["summary"],
          "location" => affiliation["location"],
          "highlights" => affiliation["highlights"],
          "keywords" => affiliation["keywords"]         
        }
      end
    end

    def governance
      @doc.dig("governance").map do |governance|
        {
          "summary" => governance["summary"],
          "category" => governance["category"],
          "roles" => [governance["role"]],
          "organization" => governance["organization"],
          "startDate" => governance["start"],
          "endDate" => governance["end"],
          "keywords" => governance["keywords"],
          "highlights" => governance["highlights"]
        }
      end
    end

    def service
      @doc.dig("service", "history").map do |service|
        {
          "category" => service["category"],
          "organization" => service["organization"],
          "roles" => [service["position"]],
          "url" => service["url"],
          "startDate" => service["start"],
          "endDate" => service["end"],
          "summary" => service["summary"],
          "location" => service["location"],
          "highlights" => service["highlights"],
          "keywords" => service["keywords"]      
        }
      end
    end

    def references
      @doc.dig("references").map do |reference|
        {
          "name" => reference["name"],
          "role" => reference["role"],
          "category" => reference["category"],
          "private" => reference["private"],
          "contact" => reference["contact"],
          "summary" => reference["summary"]
        }
      end
    end

    def disposition
      {
        "travel" => @doc.dig("disposition", "travel"),
        "authorization" => @doc.dig("disposition", "authorization"),
        "commitment" => @doc.dig("disposition", "commitment"),
        "remote" => @doc.dig("disposition", "remote"),
        "relocation" => {
          "willing" => @doc.dig("disposition", "relocation", "willing"),
          "destinations" => @doc.dig("disposition", "relocation", "destinations")
        }
      }
    end

    def location
      @doc.dig("location")
    end

    def samples
      @doc.dig("samples")
    end

    def testimonials
      @doc.dig("testimonials")
    end
  end
end