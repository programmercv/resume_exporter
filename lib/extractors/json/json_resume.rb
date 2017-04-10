module Extractor
  class JsonResume
    def initialize(doc)
      @doc = doc
    end

    def meta
      {
        "version" => @doc.dig("meta", "version")
      }
    end

    def basics
      {
        "name" => @doc.dig("basics", "name"),
        "label" => @doc.dig("basics", "label"),
        "image" => @doc.dig("basics", "image"),
        "summary" => @doc.dig("basics", "summary"),
        "location" => @doc.dig("basics", "location"),
        "contact" => {
          "email" => @doc.dig("basics", "email"),
          "phone" => @doc.dig("basics", "phone"),
          "website" => @doc.dig("basics", "url"),
          "location" => @doc.dig("basics", "location", "address"),
          "social" => @doc.dig("basics", "profiles").map do |p| 
            {
              "network" => p["network"],
              "user" => p["username"],
              "url" => p["url"]
            }
          end
        }
      }
    end

    def employment
      @doc.dig("work").map do |job|
        {
          "employer" => job["name"],
          "position" => job["position"],
          "description" => job["description"],
          "url" => job["url"],
          "startDate" => job["startDate"],
          "endDate" => job["endDate"],
          "summary" => job["summary"],
          "highlights" => job["highlights"]
        }
      end
    end

    def education
      @doc.dig("education").map do |education|
        {
          "institution" => education["institution"],
          "fieldOfStudy" => education["area"],
          "degree" => education["studyType"],
          "startDate" => education["startDate"],
          "endDate" => education["endDate"],
          "grade" => education["gpa"],
          "curriculum" => education["courses"]
        }
      end
    end

    def projects
      @doc.dig("projects").map do |project|
        {
          "title" => project["name"],
          "summary" => project["description"],
          "url" => project["url"],
          "startDate" => project["startDate"],
          "endDate" => project["endDate"],
          "roles" => project["roles"],
          "category" => project["type"],
          "entity" => project["entity"],
          "highlights" => project["highlights"],
          "keywords" => project["keywords"]
        }
      end
    end

    def skills
      @doc.dig("skills").map do |skill|
        {
          "name" => skill["name"],
          "level" => skill["level"],
          "keywords" => skill["keywords"]
        }
      end
    end

    def recognition
      @doc.dig("awards").map do |award|
        {
          "title" => award["title"],
          "category" => "Award",
          "startDate" => award["date"],
          "from" => award["awarder"],
          "summary" => award["summary"]
        }
      end
    end

    def writing
      @doc.dig("publications").map do |publication|
        {
          "title" => publication["name"],
          "publisher" => publication["publisher"],
          "date" => publication["releaseDate"],
          "url" => publication["url"],
          "summary" => publication["summary"]
        }
      end
    end

    def languages
      @doc.dig("languages").map do |language|
        {
          "language" => language["language"],
          "level" => language["fluency"]
        }
      end
    end

    def interests
      @doc.dig("interests").map do |interest|
        {
          "name" => interest["name"],
          "keywords" => interest["keywords"]
        }
      end
    end

    def service
      @doc.dig("volunteer").map do |volunteer|
        {
          "category" => "Volunteer Work",
          "organization" => volunteer["organization"],
          "roles" => [volunteer["position"]],
          "url" => volunteer["url"],
          "startDate" => volunteer["startDate"],
          "endDate" => volunteer["endDate"],
          "summary" => volunteer["summary"],
          "highlights" => volunteer["highlights"]
        }
      end
    end

    def references
      @doc.dig("references").map do |reference|
        {
          "name" => reference["name"],
          "summary" => reference["reference"]
        }
      end
    end
  end
end