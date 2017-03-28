xml.meta do
  xml.format "PRTFLIO@0.0.1"
  xml.version "0.0.1"
end


xml.basics do
  xml.name @data.dig(:basics, :name)
  xml.label @data.dig(:basics, :label) 
  xml.image @data.dig(:basics, :image) 
  xml.summary @data.dig(:basics, :summary) 
  xml.contact do
    xml.email @data.dig(:basics, :contact, :email)
    xml.phone @data.dig(:basics, :contact, :phone)
    xml.website @data.dig(:basics, :contact, :website)
    xml.location @data.dig(:basics, :contact, :location)
    xml.social @data.dig(:basics, :contact, :social) do |social|
      xml.network social[:network]
      xml.user social[:user]
      xml.url social[:url]
    end
  end
end

xml.employment do
  xml.summary @data.dig(:employment, :summary)
  xml.history @data.dig(:employment, :history) do |job|          
    xml.employer job[:employer] 
    xml.position job[:position]
    xml.url job[:url]
    xml.startDate job[:startDate] 
    xml.endDate job[:endDate] 
    xml.summary job[:summary] 
    xml.location job[:location] 
    xml.highlights job[:highlights]
    xml.keywords job[:keywords]
  end
end

xml.education do
  xml.summary @data.dig(:education, :summary)
  xml.history @data.dig(:education, :history) do |entry|
    xml.institution entry[:institution]
    xml.fieldOfStudy entry[:fieldOfStudy]
    xml.degree entry[:degree]
    xml.startDate entry[:startDate]
    xml.endDate entry[:endDate]
    xml.grade entry[:grade]
    xml.url entry[:url]
    xml.summary entry[:summary]
    xml.location entry[:location]
    xml.curriculum entry[:curriculum]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.projects do
  xml.summary @data.dig(:projects, :summary)
  xml.history @data.dig(:projects, :history) do |project|
    xml.title project[:title]
    xml.description project[:description]
    xml.url project[:url]
    xml.repo project[:repo]
    xml.startDate project[:startDate]
    xml.endDate project[:endDate]
    xml.category project[:category]
    xml.images project[:images] do |image|            
      xml.thumbnail image[:thumbnail]
      xml.big image[:big]
    end
    xml.roles project[:roles]
    xml.highlights project[:highlights]
    xml.keywords project[:keywords]
  end
end

xml.openSource do
  xml.summary @data.dig(:openSource, :summary)
  xml.history @data.dig(:openSource, :history) do |project|
    xml.title project[:title]
    xml.description project[:description]
    xml.role project[:role]
    xml.url project[:url]
    xml.repo project[:repo]
    xml.startDate project[:startDate]
    xml.endDate project[:endDate]
    xml.category project[:category]
    xml.roles project[:roles]
    xml.highlights project[:highlights]
    xml.keywords project[:keywords]
  end
end

xml.skills do
  xml.summary @data.dig(:skills, :summary)
  xml.sets @data.dig(:skills, :sets) do |skill|
    xml.name skill[:name]
    xml.description skill[:description]
    xml.keywords skill[:keywords]
  end
end

xml.qualifications do
  xml.summary @data.dig(:qualifications, :summary)
  xml.history @data.dig(:qualifications, :history) do |qualification|
    xml.category qualification[:category]
    xml.title qualification[:title]
    xml.date qualification[:date]
    xml.from qualification[:from]
    xml.summary qualification[:summary]
    xml.url qualification[:url]
    xml.highlights qualification[:highlights]
    xml.keywords qualification[:keywords]
  end
end

xml.recognition do
  xml.summary @data.dig(:recognition, :summary)
  xml.history @data.dig(:recognition, :history) do |entry|
    xml.category entry[:category]
    xml.title entry[:title]
    xml.date entry[:date]
    xml.from entry[:from]
    xml.summary entry[:summary]
    xml.url entry[:url]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.writing do
  xml.summary @data.dig(:writing, :summary)
  xml.history @data.dig(:writing, :history) do |entry|
    xml.title entry[:title]
    xml.category entry[:category]
    xml.publisher entry[:publisher]
    xml.date entry[:date]
    xml.url entry[:url]
    xml.summary entry[:summary]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.reading do
  xml.summary @data.dig(:reading, :summary)
  xml.history @data.dig(:reading, :history) do |entry|
    xml.title entry[:title]
    xml.category entry[:category]
    xml.url entry[:url]
    xml.author entry[:author]
    xml.date entry[:date]
    xml.summary entry[:summary]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.speaking do
  xml.summary @data.dig(:speaking, :summary)
  xml.history @data.dig(:speaking, :history) do |entry|
    xml.title entry[:title]
    xml.event entry[:event]
    xml.location entry[:location]
    xml.url entry[:url]
    xml.date entry[:date]
    xml.summary entry[:summary]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.patents do
  xml.summary @data.dig(:patents, :summary)
  xml.history @data.dig(:patents, :history) do |patent|
    xml.title entry[:title]
    xml.url entry[:url]
    xml.number entry[:number]
    xml.status entry[:status]
    xml.description entry[:description]
    xml.date entry[:date]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.languages do
  xml.summary @data.dig(:languages, :summary)
  xml.list @data.dig(:languages, :list) do |language|
    xml.language language[:language]
    xml.level language[:level]
    xml.years language[:years]
  end
end

xml.interests do
  xml.summary @data.dig(:interests, :summary)
  xml.list @data.dig(:interests, :list) do |interest|
    xml.name interest[:name]
    xml.description interest[:description]
  end
end

xml.extracurriculars do
  xml.summary @data.dig(:extracurriculars, :summary)
  xml.history @data.dig(:extracurriculars, :history) do |entry|
    xml.title entry[:title]
    xml.summary entry[:summary]
    xml.category entry[:category]
    xml.url entry[:url]
    xml.location entry[:location]
    xml.startDate entry[:startDate]
    xml.endDate entry[:endDate]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.affiliations do
  xml.summary @data.dig(:affiliations, :summary)
  xml.history @data.dig(:affiliations, :history) do |entry|
    xml.category entry[:category]
    xml.organization entry[:organization]
    xml.role entry[:role]
    xml.url entry[:url]
    xml.startDate entry[:startDate]
    xml.endDate entry[:endDate]
    xml.summary entry[:summary]
    xml.location entry[:location]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.governance do
  xml.summary @data.dig(:governance, :summary)
  xml.history @data.dig(:governance, :history) do |entry|
    xml.summary entry[:summary]
    xml.category entry[:category]
    xml.url entry[:url]
    xml.role entry[:role]
    xml.organization entry[:organization]
    xml.startDate entry[:startDate]
    xml.endDate entry[:endDate]
    xml.keywords entry[:keywords]
    xml.highlights entry[:highlights]
  end
end

xml.service do
  xml.summary @data.dig(:service, :summary)
  xml.history @data.dig(:service, :history) do |entry|
    xml.category entry[:category]
    xml.organization entry[:organization]
    xml.roles entry[:roles]
    xml.url entry[:url]
    xml.startDate entry[:startDate]
    xml.endDate entry[:endDate]
    xml.summary entry[:summary]
    xml.location entry[:location]
    xml.highlights entry[:highlights]
    xml.keywords entry[:keywords]
  end
end

xml.references do
  xml.summary @data.dig(:references, :summary)
  xml.history @data.dig(:references, :history) do |reference|
    xml.name reference[:name]
    xml.role reference[:role]
    xml.company reference[:company]
    xml.summary reference[:summary]
  end
end

xml.disposition do
  xml.summary @data.dig(:disposition, :summary)
  xml.travel @data.dig(:disposition, :travel)
  xml.authorization @data.dig(:disposition, :authorization)
  xml.commitment @data.dig(:disposition, :commitment)
  xml.remote @data.dig(:disposition, :remote)
  xml.relocation do
    xml.willing @data.dig(:disposition, :relocation, :willing)
    xml.destinations @data.dig(:disposition, :relocation, :destinations)
  end
end