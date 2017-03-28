json.name @data.dig(:basics, :name)

json.meta do
  json.format "FRESH@0.6.0"
  json.version @data.dig(:meta, :version)
end

json.info do
  json.label @data.dig(:basics, :label)
  json.class @data.dig(:basics, :class)
  json.image @data.dig(:basics, :image)
  json.brief @data.dig(:basics, :summary)
  json.quote @data.dig(:basics, :quote)
end

json.disposition do
  json.travel @data.dig(:disposition, :travel)
  json.authorization @data.dig(:disposition, :authorization)
  json.commitment @data.dig(:disposition, :commitment)
  json.remote @data.dig(:disposition, :remote)
  json.relocation do
    json.willing @data.dig(:disposition, :relocation, :willing)
    json.destinations @data.dig(:disposition, :relocation, :destinations)
  end
end

json.contact do
  json.email @data.dig(:basics, :contact, :email)
  json.phone @data.dig(:basics, :contact, :phone)
  json.website @data.dig(:basics, :contact, :website)
  json.other @data.dig(:basics, :contact, :other)
end

json.location do
  json.address @data.dig(:location, :address) || @data.dig(:basics, :contact, :location)
  json.code @data.dig(:location, :code)
  json.city @data.dig(:location, :city)
  json.country @data.dig(:location, :country)
  json.region @data.dig(:location, :region)
end

json.employment do
  json.summary @data.dig(:employment, :summary)
  json.history @data.dig(:employment, :history) do |job|
    json.employer job[:employer]
    json.position job[:position]
    json.url job[:url]
    json.start job[:startDate]
    json.end job[:endDate]
    json.summary job[:summary]
    json.location job[:location]
    json.highlights job[:highlights]
    json.keywords job[:keywords]
  end
end

json.projects @data.dig(:projects, :history) do |project|
  json.title project[:title]
  json.category project[:category]
  json.description project[:description]
  json.summary project[:summary]
  json.role project[:roles].join(", ") if project[:roles]
  json.url project[:url]
  json.media project[:media]
  json.repo project[:repo]
  json.start project[:startDate]
  json.end project[:endDate]
  json.highlights project[:highlights]
  json.location project[:location]
  json.keywords project[:keywords]
end

json.skills do
  json.sets @data.dig(:skills, :sets) do |skill|
    json.name skill[:name]
    json.level skill[:level]
    json.skills skill[:keywords]
  end

  json.list @data.dig(:skills, :list)
end

json.service do
  json.summary @data.dig(:service, :summary)
  json.history @data.dig(:service, :history) do |entry|
    json.category entry[:category]
    json.organization entry[:organization]
    json.position entry[:roles].join(", ") if entry[:roles]
    json.url entry[:url]
    json.start entry[:startDate]
    json.end entry[:endDate]
    json.summary entry[:summary]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
    json.location entry[:location]
  end
end

json.education do
  json.summary @data.dig(:education, :summary)
  json.level @data.dig(:education, :level)
  json.degree @data.dig(:education, :degree)
  json.history @data.dig(:education, :history) do |entry|
    json.title entry[:title]
    json.institution entry[:institution]
    json.area entry[:fieldOfStudy]
    json.studyType entry[:degree]
    json.start entry[:startDate]
    json.end entry[:endDate]
    json.grade entry[:grade]
    json.curriculum entry[:curriculum]
    json.url entry[:url]
    json.summary entry[:description]
    json.keywords entry[:keywords]
    json.highlights entry[:highlights]
    json.location entry[:location]
  end
end

json.social @data.dig(:basics, :contact, :social)

json.recognition @data.dig(:recognition, :history) do |entry|
  json.category entry[:category]
  json.title entry[:title]
  json.date entry[:startDate]
  json.from entry[:from]
  json.summary entry[:summary]
  json.url entry[:url]
end

json.writing @data.dig(:writing, :history) do |entry|
  json.title entry[:title]
  json.category entry[:category]
  json.publisher entry[:publisher]
  json.date entry[:date]
  json.url entry[:url]
  json.summary entry[:summary]
end

json.reading @data.dig(:reading, :history) do |entry|
  json.title entry[:title]
  json.category entry[:category]
  json.url entry[:url]
  json.author entry[:author]
  json.date entry[:date]
  json.summary entry[:summary]
end

json.speaking @data.dig(:speaking, :history) do |entry|
  json.title entry[:title]
  json.event entry[:event]
  json.location entry[:location]
  json.date entry[:date]
  json.summary entry[:summary]
  json.highlights entry[:highlights]
  json.keywords entry[:keywords]
end

json.governance @data.dig(:governance, :history) do |entry|
  json.summary entry[:summary]
  json.category entry[:category]
  json.role entry[:roles].join(", ") if entry[:roles]
  json.organization entry[:organization]
  json.start entry[:startDate]
  json.end entry[:endDate]
  json.keywords entry[:keywords]
  json.highlights entry[:highlights]
end

json.languages @data.dig(:languages, :list) do |language|
  json.language language[:language]
  json.level language[:level]
  json.years language[:years]
end

json.samples @data.dig(:samples)

json.references @data.dig(:references, :history) do |reference|
  json.name reference[:name]
  json.role reference[:role]
  json.category reference[:category]
  json.private reference[:private]
  json.summary reference[:summary]
  json.contact reference[:contact]
end

json.testimonials @data.dig(:testimonials)

json.interests @data.dig(:interests, :list) do |interest|
  json.name interest[:name]
  json.summary interest[:description]
  json.keywords interest[:keywords]
end

json.extracurricular @data.dig(:extracurriculars, :history) do |entry|
  json.title entry[:title]
  json.activity entry[:summary]
  json.location entry[:location]
  json.start entry[:startDate]
  json.end entry[:endDate]
end

json.affiliation do
  json.summary @data.dig(:affiliations, :summary)
  json.history @data.dig(:affiliations, :history) do |entry|
    json.category entry[:category]
    json.organization entry[:organization]
    json.role entry[:roles].join(", ") if entry[:roles]
    json.url entry[:url]
    json.start entry[:startDate]
    json.end entry[:endDate]
    json.summary entry[:summary]
    json.location entry[:location]
    json.highlights entry[:highlights]
    json.keywords entry[:keywords]
  end
end