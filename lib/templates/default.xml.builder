xml.meta do
  xml.format "PRTFLIO@0.0.1"
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
    xml.social @data.dig("basics", "contact", "social") do |social|
      xml.network social["network"]
      xml.user social["user"]
      xml.url social["url"]
    end
  end
end

xml.employment @data.dig("employment") do |job|          
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

xml.education @data.dig("education") do |entry|
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

xml.projects @data.dig("projects") do |project|
    xml.title project["title"]
    xml.summary project["summary"]
    xml.url project["url"]
    xml.repo project["repo"]
    xml.startDate project["startDate"]
    xml.endDate project["endDate"]
    xml.category project["category"]
    xml.images project["images"] do |image|            
      xml.thumbnail image["thumbnail"]
      xml.big image["big"]
    end
    xml.keywords project["keywords"]
  end
end

xml.openSource @data.dig("openSource") do |project|
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

xml.skills @data.dig("skills") do |skill|
    xml.name skill["name"]
    xml.summary skill["summary"]
    xml.keywords skill["keywords"]
  end
end

xml.qualifications @data.dig("qualifications") do |qualification|
    xml.category qualification["category"]
    xml.title qualification["title"]
    xml.date qualification["date"]
    xml.from qualification["from"]
    xml.summary qualification["summary"]
    xml.url qualification["url"]
    xml.keywords qualification["keywords"]
  end
end

xml.recognition @data.dig("recognition") do |entry|
    xml.category entry["category"]
    xml.title entry["title"]
    xml.date entry["date"]
    xml.from entry["from"]
    xml.summary entry["summary"]
    xml.url entry["url"]
    xml.keywords entry["keywords"]
  end
end

xml.writing @data.dig("writing") do |entry|
    xml.title entry["title"]
    xml.category entry["category"]
    xml.publisher entry["publisher"]
    xml.date entry["date"]
    xml.url entry["url"]
    xml.summary entry["summary"]
    xml.keywords entry["keywords"]
  end
end

xml.reading @data.dig("reading") do |entry|
    xml.title entry["title"]
    xml.category entry["category"]
    xml.url entry["url"]
    xml.author entry["author"]
    xml.date entry["date"]
    xml.summary entry["summary"]
    xml.keywords entry["keywords"]
  end
end

xml.speaking @data.dig("speaking") do |entry|
    xml.title entry["title"]
    xml.event entry["event"]
    xml.location entry["location"]
    xml.url entry["url"]
    xml.date entry["date"]
    xml.summary entry["summary"]
    xml.keywords entry["keywords"]
  end
end

xml.patents @data.dig("patents") do |patent|
    xml.title entry["title"]
    xml.url entry["url"]
    xml.number entry["number"]
    xml.status entry["status"]
    xml.summary entry["summary"]
    xml.date entry["date"]
    xml.keywords entry["keywords"]
  end
end

xml.languages @data.dig("languages") do |language|
    xml.language language["language"]
    xml.level language["level"]
    xml.years language["years"]
  end
end

xml.interests @data.dig("interests") do |interest|
    xml.name interest["name"]
    xml.summary interest["summary"]
  end
end

xml.extracurriculars @data.dig("extracurriculars") do |entry|
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

xml.affiliations @data.dig("affiliations") do |entry|
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

xml.governance @data.dig("governance") do |entry|
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

xml.service @data.dig("service") do |entry|
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

xml.references @data.dig("references") do |reference|
    xml.name reference["name"]
    xml.role reference["role"]
    xml.company reference["company"]
    xml.summary reference["summary"]
  end
end