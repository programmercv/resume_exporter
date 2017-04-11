Gem::Specification.new do |gem|
  gem.name        = 'resume_exporter'
  gem.version     = '1.1.1'
  gem.date        = '2017-03-28'
  gem.summary     = "A tool to export résumé data from different sources (LinkedIn, Xing, Stackoverflow)"
  gem.description = "It extracts résumé data from public profile html files and exports to json, xml, yml, md, txt, html, pdf"
  gem.authors     = ["Wolfram Müller"]
  gem.email       = 'hi@wnm.io'
  gem.files       = Dir['lib/**/*']
  gem.homepage    =
    'http://programmercv.com/resume_exporter'
  gem.license       = 'MIT'
  gem.executables << 'resume_exporter'

  gem.add_dependency 'nokogiri', '~> 1.6'
  gem.add_dependency 'builder', '~> 3.2'
  gem.add_dependency 'commander', '~> 4.4'
  gem.add_dependency 'ruby_dig', '~> 0.0.2'
  gem.add_dependency 'tilt', '~> 2.0'
  gem.add_dependency 'tilt-jbuilder', '~> 0.7'
  gem.add_dependency 'liquid', '~> 4.0'
  gem.add_dependency 'yajl-ruby', '~> 1.3'
  gem.add_dependency 'safe_yaml', '~> 1.0'
  gem.add_dependency 'wkhtmltopdf-binary', '~> 0.12'
  gem.add_dependency 'pdfkit', '~> 0.8'
  gem.add_dependency 'caracal', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 3.5'
  gem.add_development_dependency 'rake', '~> 11.3'
  gem.add_development_dependency 'byebug', '~> 9.0'
end
