<h3 align="center">
  <img src="resume_exporter.png" alt="ResumeExporter Logo" />
</h3>

RésuméExporter
============

[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/prtflio/resume_exporter/blob/master/LICENSE)
[![Gem](https://img.shields.io/gem/v/resume_exporter.svg?style=flat)](https://rubygems.org/gems/resume_exporter)
[![Travis](https://img.shields.io/travis/prtflio/resume_exporter.svg)](https://travis-ci.org/prtflio/resume_exporter)


RésuméExporter is a tool to export résumé data from different sources (LinkedIn, Xing, Stackoverflow) to json or xml.

## Installation

### For command line usage

Install the gem from RubyGems:

`gem install resume_exporter`


### To include in your ruby project

Add it to your Gemfile:

`gem 'resume_exporter'`

Then run `bundle install`

## Usage

### From the command line

Save your profile (e.g. from LinkedIn, Xing, or Stackoverflow) as html and export to json or xml with the help of ResumeExporter.

Example 1: extract resume data from .html file, and export as json:

    resume_exporter /path/to/your/profile.html
    

Example 2: extract resume data from .html file, export as json and save to file:

    resume_exporter /path/to/your/profile.html >> your_file.json


Example 3: extract resume data from .html file, and export as xml

    resume_exporter /path/to/your/profile.html --format xml


Example 4: extract resume data from .html file, export as xml and save to file

    resume_exporter /path/to/your/profile.html --format xml >> your_file.xml

### In your ruby project

```ruby
require "resume_exporter"
r = ResumeExporter.new("path/to/your/profile.html")

r.to_json # returns all attributes as json
r.to_xml # returns all attributes as xml

# you can access individual attributes like:

r.first_name
r.last_name
r.title
r.picture
r.location
r.websites
r.summary
r.experience
r.certifications
r.education
r.interests
r.skills
r.languages
r.volunteer_experiences
r.awards
r.courses
r.organizations
r.test_scores
r.patents
r.projects
r.open_source_projects
r.publications
r.technologies
```