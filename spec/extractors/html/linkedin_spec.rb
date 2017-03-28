# encoding: UTF-8
require 'spec_helper'

describe Extractor::Linkedin do
  context "having a public LinkedIn profile html" do
    let(:doc) { File.open(RSpec.root + "fixtures/linkedin.html") { |f| Nokogiri::HTML(f, nil, 'utf-8') } }
    subject{ Extractor::Linkedin.new(doc) }

    describe ".basics" do
      let(:result) do
        {
          :name=>"John Doe",
          :label => "Software Developer at Fake Test Company Inc.",
          summary: "A summary",
          :image=>"picture.jpg",
          contact: {
            :location => "Kassel, Hessen, Germany",
            website: "http://first-website.com"
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
          :history => [
            {
              :position=>"First Experience Title",
              :employer=>"First Experience Company Name",
              summary: "First Experience Description",
              :startDate=>"April 2009"
            },
            {
              :position=>"Second Experience Title",
              :employer=>"Second Experience Company Name",
              summary: "Second Experience Description",
              :startDate=>"March 2009",
              :endDate=>"February 2010"
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
          :history => [
            {
              :institution=>"Second School",
              :fieldOfStudy=>"Second School Field of Study",
              :degree => "Second School Degree",
              :grade => "Second School Grade",
              :summary=>"Second School Description",
              :startDate=>"2002",
              :endDate=>"2004"
            },
            {
              :institution=>"First School",
              :fieldOfStudy=>"First School Field of Study",
              :degree => "First School Degree",
              :grade => "First School Grade",
              :summary=>"First School Description",
              :startDate=>"2000",
              :endDate=>"2002"
            }
          ],
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
              category: "Certification",
              title: "First Certification Name",
              from: "First Certification Authority, License First Certification License Number",
              url: "http://first-certification-url.com",
              startDate: "January 2014"
            },
            {
              category: "Certification",
              title: "Second Certification Name",
              from: "Second Certification Authority, License Second Certification License Number",
              url: "http://second-certification-url.com",
              startDate: "February 2014",
              endDate: "March 2060"
            },
            {
              category: "Certification",
              title: "third name",
              from: "third authority",
              url: "http://cert-url.com",
              startDate: "January 2016"
            },
            {
              category: "Certification",
              title: "fourth name",
              from: "License fourth number",
              url: "http://url.com",
              startDate: "February 2014"
            },
            {
              category: "Course",
              title: "First Course Name (1)"
            },
            {
              category: "Course",
              title: "Second Course Name (2)"
            },
            {
              category: "Test Score",
              title: "First Test Score Name",
              startDate: "February 2015",
              summary: "First Test Score Description"
            },
            {
              category: "Test Score",
              title: "Second Test Score Name",
              startDate: "January 2015",
              summary: "Second Test Score Description"
            }
          ]
        }
      end

      it "should extract qualifications data" do
        expect(subject.qualifications).to eq result
      end
    end

    describe ".skills" do
      let(:result) do
        {
          sets: [
            {
              name: "Skill One"
            },
            {
              name: "Skill Two"
            },
            {
              name: "Skill Three"
            }
          ]
        }
      end

      it "should extract skills data" do
        expect(subject.skills).to eq result
      end
    end

    describe ".languages" do
      let(:result) do
        {
          list: [
            {
              language: "English",
              level: "Native or bilingual proficiency"
            },
            {
              language: "French",
              level: "Elementary proficiency"
            },
            {
              language: "German",
              level: "Professional working proficiency"
            }
          ]
        }
      end

      it "should extract languages data" do
        expect(subject.languages).to eq result
      end
    end

    describe ".service" do
      let(:result) do
        {
          history: [
            {
              category: "Volunteer Work",
              roles: ["First Volunteering Role"],
              organization: "First Volunteering Organization",
              summary: "First Volunteering Description",
              startDate: "March 2008"
            },
            {
              category: "Volunteer Work",
              roles: ["Second Volunteering Role"],
              organization: "Second Volunteering Organization",
              summary: "Second Volunteering Description",
              startDate: "March 2009"
            }
          ]
        }
      end

      it "should extract service data" do
        expect(subject.service).to eq result
      end
    end

    describe ".recognition" do
      let(:result) do
        {
          history: [
            {
              category: "Award",
              title: "First Award Title",
              from: "First Award Issuer",
              summary: "First Award Description",
              startDate: "March 2007"
            },
            {
              category: "Award",
              title: "Second Award Title",
              from: "Second Award Issuer",
              summary: "Second Award Description",
              startDate: "March 2012"
            }
          ]
        }
      end

      it "should extract recognition data" do
        expect(subject.recognition).to eq result
      end
    end

    describe ".affiliations" do
      let(:result) do
        {
          history: [
            {
              organization: "First Organization",
              roles: ["First Organization Position Held"],
              startDate: "March 2010",
              summary: "First Organization Additional Notes"
            },
            {
              organization: "Second Organization",
              roles: ["Second Organization Position Held"],
              startDate: "February 2013",
              endDate: "March 2060",
              summary: "Second Organization Additional Notes"
            }
          ]
        }
      end

      it "should extract affiliations data" do
        expect(subject.affiliations).to eq result
      end
    end

    describe ".patents" do
      let(:result) do
        {
          history: [
            {
              title: "First Patent Title",
              url: "http://first-patent-url.com",
              description: "First Patent Description"
            },
            {
              title: "Second Patent Title",
              url: "http://second-patent-url.com",
              description: "Second Patent Description",
              status: "Issued",
              date: "February 2015"
            }
          ]
        }
      end

      it "should extract patents data" do
        expect(subject.patents).to eq result
      end
    end

    describe ".projects" do
      let(:result) do
        {
          history: [
            {
              title: "First Project Name",
              url: "http://first-project.com",
              startDate: "February 2013",
              description: "First Project Description"
            },
            {
              title: "Second Project Name",
              url: "http://second-project.com",
              startDate: "February 2013",
              description: "Second Project Description"
            }
          ]
        }
      end

      it "should extract projects data" do
        expect(subject.projects).to eq result
      end
    end

    describe ".writing" do
      let(:result) do
        {
          history: [
            {
              title: "First Publication Title",
              url: "http://first-publication-url.com",
              date: "February 2015",
              summary: "First Publication Description",
              publisher: "First Publication Publication"
            },
            {
              title: "Second Publication Title",
              url: "http://second-publication-url.com",
              date: "March 2013",
              summary: "Second Publication Description",
              publisher: "Second Publication Publication"
            }
          ]
        }
      end

      it "should extract writing data" do
        expect(subject.writing).to eq result
      end
    end
  end
end
