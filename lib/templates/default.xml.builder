xml.meta do
  xml.format "PRTFLIO@1.1.0"
  xml.version "0.0.1"
end


xml.basics do
  xml.name @data.dig("basics", "name")
  xml.label @data.dig("basics", "label") 
  xml.image @data.dig("basics", "image") 
  xml.summary @data.dig("basics", "summary")
  xml.disposition @data.dig("basics", "disposition")
  xml.contact do
    xml.email @data.dig("basics", "contact", "email")
    xml.phone @data.dig("basics", "contact", "phone")
    xml.website @data.dig("basics", "contact", "website")
    xml.location @data.dig("basics", "contact", "location")
    if @data.dig("basics", "contact", "social")
      xml.social do
        @data.dig("basics", "contact", "social").each do |social|
          xml.network social["network"]
          xml.user social["user"]
          xml.url social["url"]
        end
      end
    end
  end
end 

if @data.dig("employment")
  xml.employment do
    @data.dig("employment").each do |job|
      xml.employer job["employer"] 
      xml.position job["position"]
      xml.url job["url"]
      xml.startDate job["startDate"] 
      xml.endDate job["endDate"] 
      xml.summary job["summary"] 
      xml.location job["location"] 
      xml.keywords job["keywords"]
    end
  end
end

if @data.dig("education")
  xml.education do
    @data.dig("education").each do |entry|
      xml.institution entry["institution"]
      xml.fieldOfStudy entry["fieldOfStudy"]
      xml.degree entry["degree"]
      xml.startDate entry["startDate"]
      xml.endDate entry["endDate"]
      xml.grade entry["grade"]
      xml.url entry["url"]
      xml.summary entry["summary"]
      xml.location entry["location"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("projects")
  xml.projects do
    @data.dig("projects").each do |project|
      xml.title project["title"]
      xml.summary project["summary"]
      xml.url project["url"]
      xml.repo project["repo"]
      xml.startDate project["startDate"]
      xml.endDate project["endDate"]
      xml.category project["category"]
      if project.dig("images")
        xml.images do
          project.dig("images").each do |image|
            xml.thumbnail image["thumbnail"]
            xml.big image["big"]
          end
        end
      end
      xml.keywords project["keywords"]
    end
  end
end

if @data.dig("openSource")
  xml.openSource do
    @data.dig("openSource").each do |project|
      xml.title project["title"]
      xml.summary project["summary"]
      xml.role project["role"]
      xml.url project["url"]
      xml.repo project["repo"]
      xml.startDate project["startDate"]
      xml.endDate project["endDate"]
      xml.category project["category"]
      xml.keywords project["keywords"]
    end
  end
end

if @data.dig("skills")
  xml.skills do
    @data.dig("skills").each do |skill|
      xml.name skill["name"]
      xml.summary skill["summary"]
      xml.keywords skill["keywords"]
    end
  end
end

if @data.dig("qualifications")
  xml.qualifications do
    @data.dig("qualifications").each do |qualification|
      xml.category qualification["category"]
      xml.title qualification["title"]
      xml.date qualification["date"]
      xml.from qualification["from"]
      xml.summary qualification["summary"]
      xml.url qualification["url"]
      xml.keywords qualification["keywords"]
    end
  end
end

if @data.dig("recognition")
  xml.recognition do
    @data.dig("recognition").each do |entry|
      xml.category entry["category"]
      xml.title entry["title"]
      xml.date entry["date"]
      xml.from entry["from"]
      xml.summary entry["summary"]
      xml.url entry["url"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("writing")
  xml.writing do
    @data.dig("writing").each do |entry|
      xml.title entry["title"]
      xml.category entry["category"]
      xml.publisher entry["publisher"]
      xml.date entry["date"]
      xml.url entry["url"]
      xml.summary entry["summary"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("reading")
  xml.reading do
    @data.dig("reading").each do |entry|
      xml.title entry["title"]
      xml.category entry["category"]
      xml.url entry["url"]
      xml.author entry["author"]
      xml.date entry["date"]
      xml.summary entry["summary"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("speaking")
  xml.speaking do
    @data.dig("speaking").each do |entry|
      xml.title entry["title"]
      xml.event entry["event"]
      xml.location entry["location"]
      xml.url entry["url"]
      xml.date entry["date"]
      xml.summary entry["summary"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("patents")
  xml.patents do
    @data.dig("patents").each do |entry|
      xml.title entry["title"]
      xml.url entry["url"]
      xml.number entry["number"]
      xml.status entry["status"]
      xml.summary entry["summary"]
      xml.date entry["date"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("languages")
  xml.languages do
    @data.dig("languages").each do |language|
      xml.language language["language"]
      xml.level language["level"]
      xml.years language["years"]
    end
  end
end

if @data.dig("interests")
  xml.interests do
    @data.dig("interests").each do |interest|
      xml.name interest["name"]
      xml.summary interest["summary"]
    end
  end
end

if @data.dig("extracurricular")
  xml.extracurricular do
    @data.dig("extracurricular").each do |entry|
      xml.title entry["title"]
      xml.summary entry["summary"]
      xml.category entry["category"]
      xml.url entry["url"]
      xml.location entry["location"]
      xml.startDate entry["startDate"]
      xml.endDate entry["endDate"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("affiliation")
  xml.affiliation do
    @data.dig("affiliation").each do |entry|
      xml.category entry["category"]
      xml.organization entry["organization"]
      xml.role entry["role"]
      xml.url entry["url"]
      xml.startDate entry["startDate"]
      xml.endDate entry["endDate"]
      xml.summary entry["summary"]
      xml.location entry["location"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("governance")
  xml.governance do
    @data.dig("governance").each do |entry|
      xml.summary entry["summary"]
      xml.category entry["category"]
      xml.url entry["url"]
      xml.role entry["role"]
      xml.organization entry["organization"]
      xml.startDate entry["startDate"]
      xml.endDate entry["endDate"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("service")
  xml.service do
    @data.dig("service").each do |entry|
      xml.category entry["category"]
      xml.organization entry["organization"]
      xml.url entry["url"]
      xml.startDate entry["startDate"]
      xml.endDate entry["endDate"]
      xml.summary entry["summary"]
      xml.location entry["location"]
      xml.keywords entry["keywords"]
    end
  end
end

if @data.dig("references")
  xml.references do
    @data.dig("references").each do |reference|
      xml.name reference["name"]
      xml.role reference["role"]
      xml.company reference["company"]
      xml.summary reference["summary"]
    end
  end
end