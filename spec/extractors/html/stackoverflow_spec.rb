# encoding: UTF-8
require 'spec_helper'

describe Extractor::Stackoverflow do
  context "having a public Stackoverflow profile html" do
    let(:doc) { File.open(RSpec.root + "fixtures/stackoverflow.html") { |f| Nokogiri::HTML(f, nil, 'utf-8') } }
    subject{ Extractor::Stackoverflow.new(doc) }

    describe ".basics" do
      let(:result) do
        {
          name: "John Doe",
          label: "John Doe title",
          image: "https://www.gravatar.com/avatar/profile.png",
          contact: {
            website: "https://wnm.io",
            location: "Berlin, Germany"
          }
        }
      end

      it "should extract basics data" do
        expect(subject.basics).to eq result
      end
    end

    describe ".employment" do
      let(:result) do
        {        
          history: [
            {          
              employer: "Prtfl.io",
              position: "Self-employed",
              startDate: "Apr 2015",
              endDate: "Current",
              keywords: ["ruby-on-rails"]
            },
            {          
              employer: "BlaBla GmbH",
              position: "Software Developer",
              startDate: "Sep 2014",
              endDate: "Mar 2015",
              summary: "Lead Developer on client project",
              keywords: ["ruby", "ruby-on-rails", "elasticsearch", "ember.js"]
            },
            {          
              employer: "SoftDev GmbH",
              position: "Software Developer",
              startDate: "Mar 2013",
              endDate: "Aug 2014",
              keywords: ["ruby", "ruby-on-rails", "rspec", "capybara", "jira"]
            }
          ]
        }
      end

      it "should extract employment data" do
        expect(subject.employment).to eq result
      end
    end

    describe ".education" do
      let(:result) do
        {
          history:[
            {
              institution: "Hochschule der Medien Stuttgart",
              degree: "Bachelor of Arts, Computer Science",
              startDate: "2009",
              endDate: "2012",
              summary: "education summary",
              keywords: ["php"]
            }
          ]
        }
      end

      it "should extract education data" do
        expect(subject.education).to eq result
      end
    end

    describe ".qualifications" do
      let(:result) do
        {
          history: [
            {
              category: "Certificate",
              title: "Certification 1",
              startDate: "Feb 2013",
              endDate: "Feb 2015",
              keywords: ["Tag 1"]
            },
            {
              category: "Certificate",
              title: "Certification 2",
              startDate: "Feb 2014",
              endDate: "Feb 2016",
              keywords: ["Tag 1"]
            }
          ]
        }
      end

      it "should extract qualifications data" do
        expect(subject.qualifications).to eq result
      end
    end

    describe ".openSource" do
      let(:result) do
        {
          history: [
            {
              title: "Open Source Project 1",
              description: "description",
              repo: "http://github.com/1",
              startDate: "Mar 2009",
              endDate: "Aug 2011",
              keywords: ["tag"]
            },
            {
              title: "Open Source Project 2",
              description: "description",
              repo: "http://github.com/2",
              startDate: "Mar 2009",
              endDate: "Aug 2011",
              keywords: ["tag"]
            }
          ]
        }
      end

      it "should extract openSource data" do
        expect(subject.openSource).to eq result
      end
    end

    describe ".projects" do
      let(:result) do
        {
          history: [
            {
              title: "Project 1",
              url: "https://project.com/",
              description: "description",
              keywords: ["ruby-on-rails"]
            },
            {
              title: "Project 2",
              url: "https://project2.com/",
              startDate: "Mar 2016",
              description: "description",
              keywords: ["tag"]
            }
          ]
        }
      end

      it "should extract projects data" do
        expect(subject.projects).to eq result
      end
    end
  end
end
