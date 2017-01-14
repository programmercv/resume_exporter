Gem::Specification.new do |gem|
  gem.name        = 'resume_exporter'
  gem.version     = '0.0.1'
  gem.date        = '2016-12-06'
  gem.summary     = "A tool to export résumé data from different sources (LinkedIn, Xing, Stackoverflow)"
  gem.description = "It extracts résumé data from public profile html files and exports to json, xml"
  gem.authors     = ["Wolfram Müller"]
  gem.email       = 'hi@wnm.io'
  gem.files       = Dir['lib/**/*']
  gem.homepage    =
    'http://rubygems.org/gems/resume_exporter'
  gem.license       = 'MIT'
  gem.executables << 'resume_exporter'

  gem.add_dependency 'nokogiri', '~> 1.6'
  gem.add_dependency 'builder', '~> 3.2'
  gem.add_dependency 'commander', '~> 4.4'
  gem.add_development_dependency 'rspec', '~> 3.5'
  gem.add_development_dependency 'rake', '~> 11.3'
  gem.add_development_dependency 'byebug', '~> 9.0'
end
