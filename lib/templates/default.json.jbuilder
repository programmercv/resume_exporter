json.meta do
  json.format "PRTFLIO@0.0.1"
  json.version "0.0.1"
end


json.basics do
  json.name @data.dig("basics", "name")
  json.label @data.dig("basics", "label") 
  json.image @data.dig("basics", "image") 
  json.summary @data.dig("basics", "summary")
  json.disposition @data.dig("basics", "disposition")
  json.contact do
    json.email @data.dig("basics", "contact", "email")
    json.phone @data.dig("basics", "contact", "phone")
    json.website @data.dig("basics", "contact", "website")
    json.location @data.dig("basics", "contact", "location")
    json.social @data.dig("basics", "contact", "social") do |social|
      json.network social["network"]
      json.user social["user"]
      json.url social["url"]
    end
  end
end

json.employment @data.dig("employment") do |job|
    json.employer job["employer"] 
    json.position job["position"]
    json.url job["url"]
    json.startDate job["startDate"] 
    json.endDate job["endDate"] 
    json.summary job["summary"] 
    json.location job["location"] 
    json.keywords job["keywords"]
  end
end

json.education @data.dig("education") do |entry|
    json.institution entry["institution"]
    json.fieldOfStudy entry["fieldOfStudy"]
    json.degree entry["degree"]
    json.startDate entry["startDate"]
    json.endDate entry["endDate"]
    json.grade entry["grade"]
    json.url entry["url"]
    json.summary entry["summary"]
    json.location entry["location"]
    json.keywords entry["keywords"]
  end
end

json.projects @data.dig("projects") do |project|
    json.title project["title"]
    json.summary project["summary"]
    json.url project["url"]
    json.repo project["repo"]
    json.startDate project["startDate"]
    json.endDate project["endDate"]
    json.category project["category"]
    json.images project["images"] do |image|            
      json.thumbnail image["thumbnail"]
      json.big image["big"]
    end
    json.keywords project["keywords"]
  end
end

json.openSource @data.dig("openSource") do |project|
    json.title project["title"]
    json.summary project["summary"]
    json.role project["role"]
    json.url project["url"]
    json.repo project["repo"]
    json.startDate project["startDate"]
    json.endDate project["endDate"]
    json.category project["category"]
    json.keywords project["keywords"]
  end
end

json.skills @data.dig("skills") do |skill|
    json.name skill["name"]
    json.summary skill["summary"]
    json.keywords skill["keywords"]
  end
end

json.qualifications @data.dig("qualifications") do |qualification|
    json.category qualification["category"]
    json.title qualification["title"]
    json.startDate qualification["startDate"]
    json.endDate qualification["endDate"]
    json.from qualification["from"]
    json.summary qualification["summary"]
    json.url qualification["url"]
    json.keywords qualification["keywords"]
  end
end

json.recognition @data.dig("recognition") do |entry|
    json.category entry["category"]
    json.title entry["title"]
    json.startDate entry["startDate"]
    json.endDate entry["endDate"]
    json.from entry["from"]
    json.summary entry["summary"]
    json.url entry["url"]
    json.keywords entry["keywords"]
  end
end

json.writing @data.dig("writing") do |entry|
    json.title entry["title"]
    json.category entry["category"]
    json.publisher entry["publisher"]
    json.date entry["date"]
    json.url entry["url"]
    json.summary entry["summary"]
    json.keywords entry["keywords"]
  end
end

json.reading @data.dig("reading") do |entry|
    json.title entry["title"]
    json.category entry["category"]
    json.url entry["url"]
    json.author entry["author"]
    json.date entry["date"]
    json.summary entry["summary"]
    json.keywords entry["keywords"]
  end
end

json.speaking @data.dig("speaking") do |entry|
    json.title entry["title"]
    json.event entry["event"]
    json.location entry["location"]
    json.url entry["url"]
    json.date entry["date"]
    json.summary entry["summary"]
    json.keywords entry["keywords"]
  end
end

json.patents @data.dig("patents") do |patent|
    json.title patent["title"]
    json.url patent["url"]
    json.number patent["number"]
    json.status patent["status"]
    json.summary patent["summary"]
    json.date patent["date"]
    json.keywords patent["keywords"]
  end
end

json.languages @data.dig("languages") do |language|
    json.language language["language"]
    json.level language["level"]
    json.years language["years"]
  end
end

json.interests @data.dig("interests") do |interest|
    json.name interest["name"]
    json.summary interest["summary"]
  end
end

json.extracurriculars @data.dig("extracurriculars") do |entry|
    json.title entry["title"]
    json.summary entry["summary"]
    json.category entry["category"]
    json.url entry["url"]
    json.location entry["location"]
    json.startDate entry["startDate"]
    json.endDate entry["endDate"]
    json.keywords entry["keywords"]
  end
end

json.affiliations @data.dig("affiliations") do |entry|
    json.category entry["category"]
    json.organization entry["organization"]
    json.url entry["url"]
    json.startDate entry["startDate"]
    json.endDate entry["endDate"]
    json.summary entry["summary"]
    json.location entry["location"]
    json.keywords entry["keywords"]
  end
end

json.governance @data.dig("governance") do |entry|
    json.summary entry["summary"]
    json.category entry["category"]
    json.url entry["url"]
    json.organization entry["organization"]
    json.startDate entry["startDate"]
    json.endDate entry["endDate"]
    json.keywords entry["keywords"]
  end
end

json.service @data.dig("service") do |entry|
    json.category entry["category"]
    json.organization entry["organization"]
    json.url entry["url"]
    json.startDate entry["startDate"]
    json.endDate entry["endDate"]
    json.summary entry["summary"]
    json.location entry["location"]
    json.keywords entry["keywords"]
  end
end

json.references @data.dig("references") do |reference|
    json.name reference["name"]
    json.role reference["role"]
    json.company reference["company"]
    json.summary reference["summary"]
  end
end