json.meta do
  json.format "PRTFLIO@0.0.1"
  json.version "0.0.1"
end


json.basics do
  json.name @data.dig(:basics, :name)
  json.label @data.dig(:basics, :label) 
  json.image @data.dig(:basics, :image) 
  json.summary @data.dig(:basics, :summary) 
  json.contact do
    json.email @data.dig(:basics, :contact, :email)
    json.phone @data.dig(:basics, :contact, :phone)
    json.website @data.dig(:basics, :contact, :website)
    json.location @data.dig(:basics, :contact, :location)
    json.social @data.dig(:basics, :contact, :social) do |social|
      json.network social[:network]
      json.user social[:user]
      json.url social[:url]
    end
  end
end

json.employment do
  json.summary @data.dig(:employment, :summary)
  json.history @data.dig(:employment, :history) do |job|
    json.employer job[:employer] 
    json.position job[:position]
    json.url job[:url]
    json.startDate job[:startDate] 
    json.endDate job[:endDate] 
    json.summary job[:summary] 
    json.location job[:location] 
    json.highlights job[:highlights]
    json.keywords job[:keywords]
  end
end

json.education do
  json.summary @data.dig(:education, :summary)
  json.history @data.dig(:education, :history) do |entry|
    json.institution entry[:institution]
    json.fieldOfStudy entry[:fieldOfStudy]
    json.degree entry[:degree]
    json.startDate entry[:startDate]
    json.endDate entry[:endDate]
    json.grade entry[:grade]
    json.url entry[:url]
    json.summary entry[:summary]
    json.location entry[:location]
    json.curriculum entry[:curriculum]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.projects do
  json.summary @data.dig(:projects, :summary)
  json.history @data.dig(:projects, :history) do |project|
    json.title project[:title]
    json.description project[:description]
    json.url project[:url]
    json.repo project[:repo]
    json.startDate project[:startDate]
    json.endDate project[:endDate]
    json.category project[:category]
    json.images project[:images] do |image|            
      json.thumbnail image[:thumbnail]
      json.big image[:big]
    end
    json.roles project[:roles]
    json.highlights project[:highlights]
    json.keywords project[:keywords]
  end
end

json.openSource do
  json.summary @data.dig(:openSource, :summary)
  json.history @data.dig(:openSource, :history) do |project|
    json.title project[:title]
    json.description project[:description]
    json.role project[:role]
    json.url project[:url]
    json.repo project[:repo]
    json.startDate project[:startDate]
    json.endDate project[:endDate]
    json.category project[:category]
    json.roles project[:roles]
    json.highlights project[:highlights]
    json.keywords project[:keywords]
  end
end

json.skills do
  json.summary @data.dig(:skills, :summary)
  json.sets @data.dig(:skills, :sets) do |skill|
    json.name skill[:name]
    json.description skill[:description]
    json.keywords skill[:keywords]
  end
end

json.qualifications do
  json.summary @data.dig(:qualifications, :summary)
  json.history @data.dig(:qualifications, :history) do |qualification|
    json.category qualification[:category]
    json.title qualification[:title]
    json.startDate qualification[:startDate]
    json.endDate qualification[:endDate]
    json.from qualification[:from]
    json.summary qualification[:summary]
    json.url qualification[:url]
    json.highlights qualification[:highlights]
    json.keywords qualification[:keywords]
  end
end

json.recognition do
  json.summary @data.dig(:recognition, :summary)
  json.history @data.dig(:recognition, :history) do |entry|
    json.category entry[:category]
    json.title entry[:title]
    json.startDate entry[:startDate]
    json.endDate entry[:endDate]
    json.from entry[:from]
    json.summary entry[:summary]
    json.url entry[:url]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.writing do
  json.summary @data.dig(:writing, :summary)
  json.history @data.dig(:writing, :history) do |entry|
    json.title entry[:title]
    json.category entry[:category]
    json.publisher entry[:publisher]
    json.date entry[:date]
    json.url entry[:url]
    json.summary entry[:summary]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.reading do
  json.summary @data.dig(:reading, :summary)
  json.history @data.dig(:reading, :history) do |entry|
    json.title entry[:title]
    json.category entry[:category]
    json.url entry[:url]
    json.author entry[:author]
    json.date entry[:date]
    json.summary entry[:summary]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.speaking do
  json.summary @data.dig(:speaking, :summary)
  json.history @data.dig(:speaking, :history) do |entry|
    json.title entry[:title]
    json.event entry[:event]
    json.location entry[:location]
    json.url entry[:url]
    json.date entry[:date]
    json.summary entry[:summary]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.patents do
  json.summary @data.dig(:patents, :summary)
  json.history @data.dig(:patents, :history) do |patent|
    json.title entry[:title]
    json.url entry[:url]
    json.number entry[:number]
    json.status entry[:status]
    json.description entry[:description]
    json.date entry[:date]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.languages do
  json.summary @data.dig(:languages, :summary)
  json.list @data.dig(:languages, :list) do |language|
    json.language language[:language]
    json.level language[:level]
    json.years language[:years]
  end
end

json.interests do
  json.summary @data.dig(:interests, :summary)
  json.list @data.dig(:interests, :list) do |interest|
    json.name interest[:name]
    json.description interest[:description]
  end
end

json.extracurriculars do
  json.summary @data.dig(:extracurriculars, :summary)
  json.history @data.dig(:extracurriculars, :history) do |entry|
    json.title entry[:title]
    json.summary entry[:summary]
    json.category entry[:category]
    json.url entry[:url]
    json.location entry[:location]
    json.startDate entry[:startDate]
    json.endDate entry[:endDate]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.affiliations do
  json.summary @data.dig(:affiliations, :summary)
  json.history @data.dig(:affiliations, :history) do |entry|
    json.category entry[:category]
    json.organization entry[:organization]
    json.roles entry[:roles]
    json.url entry[:url]
    json.startDate entry[:startDate]
    json.endDate entry[:endDate]
    json.summary entry[:summary]
    json.location entry[:location]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.governance do
  json.summary @data.dig(:governance, :summary)
  json.history @data.dig(:governance, :history) do |entry|
    json.summary entry[:summary]
    json.category entry[:category]
    json.url entry[:url]
    json.roles entry[:roles]
    json.organization entry[:organization]
    json.startDate entry[:startDate]
    json.endDate entry[:endDate]
    json.keywords entry[:keywords]
    json.highlights entry[:highlights]
  end
end

json.service do
  json.summary @data.dig(:service, :summary)
  json.history @data.dig(:service, :history) do |entry|
    json.category entry[:category]
    json.organization entry[:organization]
    json.roles entry[:roles]
    json.url entry[:url]
    json.startDate entry[:startDate]
    json.endDate entry[:endDate]
    json.summary entry[:summary]
    json.location entry[:location]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end

json.references do
  json.summary @data.dig(:references, :summary)
  json.history @data.dig(:references, :history) do |reference|
    json.name reference[:name]
    json.role reference[:role]
    json.company reference[:company]
    json.summary reference[:summary]
  end
end

json.disposition do
  json.summary @data.dig(:disposition, :summary)
  json.travel @data.dig(:disposition, :travel)
  json.authorization @data.dig(:disposition, :authorization)
  json.commitment @data.dig(:disposition, :commitment)
  json.remote @data.dig(:disposition, :remote)
  json.relocation do
    json.willing @data.dig(:disposition, :relocation, :willing)
    json.destinations @data.dig(:disposition, :relocation, :destinations)
  end
end