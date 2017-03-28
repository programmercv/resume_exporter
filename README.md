<h3 align="center">
  <img src="resume_exporter.png" alt="ResumeExporter Logo" />
</h3>

RésuméExporter
============

[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/prtflio/resume_exporter/blob/master/LICENSE)
[![Gem](https://img.shields.io/gem/v/resume_exporter.svg?style=flat)](https://rubygems.org/gems/resume_exporter)
[![Travis](https://img.shields.io/travis/prtflio/resume_exporter.svg)](https://travis-ci.org/prtflio/resume_exporter)

RésuméExporter is a tool to export résumé data from different sources (LinkedIn, Xing, Stackoverflow) to json or xml.

You can use it as a [command-line tool](#from-the-command-line), as a [ruby library](#in-your-ruby-project) or online at [https://prtfl.io/](https://prtfl.io/).

This is my first gem, contributions and feedback are welcome! Please be gentle.

## TL;TR

You can use RésuméExporter to extract resume data from linkedin, xing or stackoverflow to a json file looking like [that](https://github.com/programmercv/resume_exporter/blob/master/spec/fixtures/example.json)

You can then use it to host your résumé online, with Github Pages and the ProgrammerCV [jekyll theme](https://github.com/programmercv/theme)

... or export to .md, .yml, .xml, .pdf, .doc, .html

## Installation

### For command line usage

Install the gem from RubyGems:

`gem install resume_exporter`


### To include in your ruby project

Add it to your Gemfile:

`gem 'resume_exporter'`

Then run `bundle install`

## Prerequisite

### Save your public profile as html

#### LinkedIn:

Go to your public profile at [https://www.linkedin.com/public-profile/settings](https://www.linkedin.com/public-profile/settings), or navigate to it via "Me" -> "View Profile" -> "Edit your public profile"  
Save the page as "Web Page, HTML only". 

#### Xing:

Go to your profile (sign in -> click on your name), and click on "Ansicht für Profilbesucher"
Save the page as "Web Page, HTML only". 

#### Stackoverflow:

Go to your public profile (the old CV version, not the new developer story) [e.g. https://stackoverflow.com/cv/wnm](https://stackoverflow.com/cv/wnm)  
Save the page as "Web Page, HTML only". 

## Usage

### From the command line

[Save your profile](#save-your-public-profile-as-html) as html.
Then use the `resume_exporter` command to extract data.

Example 1: extract resume data from .html file, and export as json:

    resume_exporter /path/to/your/profile.html
    

Example 2: extract resume data from .html file, export as json and save to file:

    resume_exporter /path/to/your/profile.html >> your_file.json


Example 3: extract resume data from .html file, and export as xml

    resume_exporter /path/to/your/profile.html --format xml


Example 4: extract resume data from .html file, export as xml and save to file

    resume_exporter /path/to/your/profile.html --format xml >> your_file.xml

#### Formats

Output format options are:

- xml
- json
- json_resume ([Json Resume](https://jsonresume.org/))
- fresh ([Fresh](https://github.com/fresh-standard/FRESCA))
- md (Markdown)
- yaml
- txt

Coming soon:

- html
- pdf
- doc

### In your ruby project

```ruby
require "resume_exporter"
file = "path/to/your/file"  #String or ruby Pathname
r = ResumeExporter.new(file)

r.export(format: "json") #or xml, yaml, md, fresh, jsonresume, hash

# with the hash you can do the following:

hash = r.export(format: "hash")

hash.class #=> Hash

hash.keys #=> [:meta, :basics, :employment, :education, :projects, :openSource, :skills, :qualifications, :recognition, :writing, :reading, :speaking, :patents, :languages, :interests, :extracurriculars, :affiliations, :governance, :service, :references, :disposition]

hash[:basics] #=> {:name=>"Elliot Alderson", :label=>"Cybersecurity Engineer", :image=>"http://imagecdn.com/elliot.png", :summary=>"Imaginary software engineer with 10+ years industry experience specializing in cybersecurity.", :contact=>{:email=>"elliotalderson@lavabit.com", :phone=>"0001-0101-1010101111", :website=>"https://elliotalderson.com", :location=>"New York City, USA", :social=>[{:network=>"Github", :user=>"elliotalderson", :url=>"https://github.com/elliotalderson"}, {:network=>"Linkedin", :user=>"elliotalderson", :url=>"https://linkedin.com/elliotalderson"}]}}
```