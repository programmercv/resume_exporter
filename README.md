<h3 align="center">
  <img src="resume_exporter.png" alt="ResumeExporter Logo" />
</h3>

## TL;TR
RésuméExporter is a tool to export résumé data from different sources (LinkedIn, Xing, Stackoverflow) to json, xml, md, yaml, doc, pdf, html.

RésuméExporter
============

[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/programmercv/resume_exporter/blob/master/LICENSE)
[![Gem](https://img.shields.io/gem/v/resume_exporter.svg?style=flat)](https://rubygems.org/gems/resume_exporter)
[![Travis](https://img.shields.io/travis/programmercv/resume_exporter.svg)](https://travis-ci.org/programmercv/resume_exporter)

You can use it as a [command-line tool](#from-the-command-line), as a [ruby library](#in-your-ruby-project) or online at [https://prtfl.io/](https://prtfl.io/).

This is my first gem, contributions and feedback are welcome! Please be gentle.

## Why?

Because you might need your résumé data in a different format, but don't want to retype everything.

Also: If you export to a [json file](spec/fixtures/example.json) you can use that with the ProgammerCV [jekyll theme](https://github.com/programmercv/theme) to host a html version of your résumé online.

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

Example: extract resume data from .html file, and export as json:

    resume_exporter /path/to/your/profile.html

That command will return a string, that looks like [that](spec/fixtures/example.json)
    
To save that string in a json file, run:

    resume_exporter /path/to/your/profile.html >> your_file.json

To export to other formats, run:

    resume_exporter /path/to/your/profile.html --format xml

    or
    
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