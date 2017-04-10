json.meta do
  json.canonical "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json"
  json.version "0.0.1"
  json.lastModified Time.now
end

json.basics do 
  json.name @data.dig("basics", "name")
  json.label @data.dig("basics", "label")
  json.image @data.dig("basics", "image")
  json.email @data.dig("basics", "contact", "email")
  json.phone @data.dig("basics", "contact", "phone")
  json.url @data.dig("basics", "contact", "website")
  json.summary @data.dig("basics", "summary")
  json.location @data.dig("basics", "location") || @data.dig("basics", "contact", "location")
  json.profiles @data.dig("basics", "contact", "social") do |social|
    json.network social["network"]
    json.username social["user"]
    json.url social["url"]
  end
end

json.work @data.dig("employment") do |job|
  json.name job["employer"]
  json.description job["description"]
  json.position job["position"]
  json.url job["url"]
  json.startDate job["startDate"]
  json.endDate job["endDate"]
  json.summary job["summary"]
  json.highlights job["highlights"]
end

json.volunteer @data.dig("service").select{|s| s["category"].downcase.include?("volunteer") } do |volunteer|
  json.organization volunteer["organization"]
  json.position volunteer["position"]
  json.url volunteer["url"]
  json.startDate volunteer["startDate"]
  json.endDate volunteer["endDate"]
  json.summary volunteer["summary"]
  json.highlights volunteer["highlights"]
end

json.education @data.dig("education") do |education|
  json.institution education["institution"]
  json.area education["fieldOfStudy"]
  json.studyType education["degree"]
  json.startDate education["startDate"]
  json.endDate education["endDate"]
  json.gpa education["grade"]
  json.courses education["curriculum"]
end

json.awards @data.dig("recognition").select{|a| a["category"].downcase.include?("award") } do |award|
  json.title award["title"]
  json.date award["startDate"]
  json.awarder award["from"]
  json.summary award["summary"]
end

json.publications @data.dig("writing") do |publication|
  json.name publication["title"]
  json.publisher publication["publisher"]
  json.releaseDate publication["date"]
  json.url publication["url"]
  json.summary publication["summary"]
end

json.skills @data.dig("skills") do |skill|
  json.name skill["name"]
  json.level skill["level"]
  json.keywords skill["keywords"]
end

json.languages @data.dig("languages") do |language|
  json.language language["language"]
  json.fluency language["level"]
end

json.interests @data.dig("interests") do |interest|
  json.name interest["name"]
  json.keywords interest["keywords"]
end

json.references @data.dig("references") do |reference|
  json.name reference["name"]
  json.reference reference["summary"]
end

json.projects @data.dig("projects") do |project|
  json.name project["title"]
  json.description project["summary"]
  json.highlights project["highlights"]
  json.keywords project["keywords"]
  json.startDate project["startDate"]
  json.endDate project["endDate"]
  json.url project["url"]
  json.roles project["roles"]
  json.entity project["entity"]
  json.type project["category"]
end


