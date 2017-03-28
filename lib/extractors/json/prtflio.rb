module Extractor
  class Prtflio
    def initialize(doc)
      @doc = doc
    end

    def meta
      @doc.dig(:meta)
    end

    def basics
      @doc.dig(:basics)
    end

    def employment
      @doc.dig(:employment)
    end

    def education
      @doc.dig(:education)
    end

    def projects
      @doc.dig(:projects)
    end

    def openSource
      @doc.dig(:openSource)
    end

    def skills
      @doc.dig(:skills)
    end

    def qualifications
      @doc.dig(:qualifications)
    end

    def recognition
      @doc.dig(:recognition)
    end

    def writing
      @doc.dig(:writing)
    end

    def reading
      @doc.dig(:reading)
    end

    def speaking
      @doc.dig(:speaking)
    end

    def patents
      @doc.dig(:patents)
    end

    def languages
      @doc.dig(:languages)
    end

    def interests
      @doc.dig(:interests)
    end

    def extracurriculars
      @doc.dig(:extracurriculars)
    end

    def affiliations
      @doc.dig(:affiliations)
    end

    def governance
      @doc.dig(:governance)
    end

    def service
      @doc.dig(:service)
    end

    def references
      @doc.dig(:references)
    end

    def disposition
      @doc.dig(:disposition)
    end
  end
end