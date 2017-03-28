# encoding: UTF-8
require 'spec_helper'

describe Extractor::Fresh do
  context "having a Fresh json file" do
    let(:doc) { File.open(RSpec.root + "fixtures/fresh.json") { |f| JSON.parse(f.read, symbolize_names: true) } }
    subject{ Extractor::Fresh.new(doc) }

    describe ".meta" do
      let(:result) do
        {
          format: "FRESH@0.6.0",
          version: "0.4.0"
        }
      end

      it "should extract meta data" do
        expect(subject.meta).to eq result
      end
    end

    describe ".basics" do
      let(:result) do
        {
          name: "Jane Q. Fullstacker",
          label: "Senior Developer",
          image: "jane_doe.png",
          characterClass: "Programmer",
          quote: "Be the change you want to see in the world.",          
          summary: "**Imaginary full-stack software developer with 6+ years industry experience** specializing in cloud-driven web applications and middleware. A native of southern CA, Jane enjoys hiking, mystery novels, and the company of Rufus, her two year old beagle.",
          contact: {
            email: "jdoe@onecoolstartup.io",
            phone: "1-650-999-7777",
            website: "http://janef.me/blog",
            location: "Jane Fullstacker\n123 Somewhere Rd.\nMountain View, CA 94035",
            social: [
              {
                label: "GitHub",
                network: "GitHub",
                user: "janef-was-here",
                url: "https://github.com/janef-was-here"
              },
              {
                label: "Twitter",
                network: "Twitter",
                user: "janef-was-here",
                url: "https://twitter.com/janef-was-here"
              }
            ],
            other: [
              {
                label: "Home Phone",
                flavor: "phone",
                value: "1-650-999-4321"
              },
              {
                label: "Work Phone",
                flavor: "phone",
                value: "1-650-777-1234"
              },
              {
                label: "Personal Email",
                flavor: "email",
                value: "jane@janef.me"
              }
            ]
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
          summary: "7+ years industry IT and software development experience.",
          history: [
            {
              employer: "Area 52",
              url: "https://area52.io/does-not-exist",
              position: "Head Code Ninja",
              summary: "Development team manager for [**Quantum Diorama**](https://en.wikipedia.org/wiki/Vaporware), a distributed molecular modeling and analysis suite for Linux and OS X.",
              startDate: "2013-09",
              endDate: nil,
              location: nil,
              keywords: ["Agile","PM","C","C++","R","OpenGL","Boost","MySQL","PostgreSQL","JIRA"],
              highlights: ["Managed a 5-person development team", "Accomplishment 2", "Etc."]
            },
            {
              employer: "Veridian Dynamics",
              url: "https://en.wikipedia.org/wiki/Better_Off_Ted#Plot",
              position: "Principal Developer",
              summary: "Developer on numerous projects culminating in technical lead role for the [Jabberwocky project](http://betteroffted.wikia.com/wiki/Jabberwocky) and promotion to principal developer.",
              startDate: "2011-07",
              endDate: "2013-08",
              location: nil,
              keywords: ["C++","C","Linux","R","Clojure"],
              highlights: ["Managed a 5-person development team", "Accomplishment 2", "Etc."]
            },
            {
              employer: "Stark Industries",
              url: nil,
              position: "IT Administrator",
              summary: "Junior programmer with heavy code responsibilities. Promoted to intermediate role after 6 months.",
              startDate: "2008-10",
              endDate: "2011-06",
              location: nil,
              keywords: ["Novell","Active Directory","Linux","Windows"],
              highlights: ["Promoted to intermediate developer after 6 months", "Accomplishment 2", "Etc."]
            },
            {
              employer: "Dunder Mifflin",
              url: nil,
              position: "Intern",
              summary: "Performed IT administration and deployments for Dunder Mifflin.",
              startDate: "2008-06",
              endDate: "2008-09",
              location: nil,
              keywords: ["Novell","Active Directory","Linux","Windows"],
              highlights: ["Supervised roll-out of Dunder Mifflin Infinity website.", "Performed mission-critical system backups and ", "Etc."]
            }
          ]
        }
      end

      it "should extract employment data" do
        expect(subject.employment).to eq result
      end
    end

    # describe ".education" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history:[{
    #         title: ,
    #         institution: ,
    #         fieldOfStudy: ,
    #         degree: ,
    #         start: ,
    #         end: ,
    #         grade: ,
    #         url: ,
    #         summary: ,
    #         location: ,
    #         curriculum: [],
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract education data" do
    #     expect(subject.education).to eq result
    #   end
    # end

    # describe ".projects" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         title: ,
    #         description: ,
    #         url: ,
    #         repo: ,
    #         start: ,
    #         end: ,
    #         type: ,
    #         images: [{            
    #           thumbnail: ,
    #           big: 
    #         }],
    #         roles: [],
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract projects data" do
    #     expect(subject.projects).to eq result
    #   end
    # end

    # describe ".openSource" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         title: ,
    #         description: ,
    #         role: ,
    #         url: ,
    #         repo: ,
    #         start: ,
    #         end: ,
    #         type: ,
    #         roles: [],
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract openSource data" do
    #     expect(subject.openSource).to eq result
    #   end
    # end

    # describe ".skills" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         name: ,
    #         description: ,
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract skills data" do
    #     expect(subject.skills).to eq result
    #   end
    # end

    # describe ".qualifications" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         category: ,
    #         title: ,
    #         date: ,
    #         from: ,
    #         summary: ,
    #         url: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract qualifications data" do
    #     expect(subject.qualifications).to eq result
    #   end
    # end

    # describe ".recognition" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         category: ,
    #         title: ,
    #         date: ,
    #         from: ,
    #         summary: ,
    #         url: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract recognition data" do
    #     expect(subject.recognition).to eq result
    #   end
    # end

    # describe ".writing" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         title: ,
    #         category: ,
    #         date: ,
    #         url: ,
    #         publisher: ,
    #         summary: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract writing data" do
    #     expect(subject.writing).to eq result
    #   end
    # end

    # describe ".reading" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         title: ,
    #         category: ,
    #         url: ,
    #         author: ,
    #         date: ,
    #         summary: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract reading data" do
    #     expect(subject.reading).to eq result
    #   end
    # end

    # describe ".speaking" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         title: ,
    #         event: ,
    #         location: ,
    #         date: ,
    #         summary: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract speaking data" do
    #     expect(subject.speaking).to eq result
    #   end
    # end

    # describe ".patents" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         title: ,
    #         url: ,
    #         number: ,
    #         status: ,
    #         description: ,
    #         date: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract patents data" do
    #     expect(subject.patents).to eq result
    #   end
    # end

    # describe ".languages" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         language: ,
    #         level: ,
    #         years: 
    #       }]
    #     }
    #   end

    #   it "should extract languages data" do
    #     expect(subject.languages).to eq result
    #   end
    # end

    # describe ".interests" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         name: ,
    #         description: 
    #       }]
    #     }
    #   end

    #   it "should extract interests data" do
    #     expect(subject.interests).to eq result
    #   end
    # end

    # describe ".extracurricular" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         title: ,
    #         activity: ,
    #         location: ,
    #         start: ,
    #         end: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract extracurricular data" do
    #     expect(subject.extracurricular).to eq result
    #   end
    # end

    # describe ".affiliation" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         category: ,
    #         organization: ,
    #         role: ,
    #         url: ,
    #         start: ,
    #         end: ,
    #         summary: ,
    #         location: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract affiliation data" do
    #     expect(subject.affiliation).to eq result
    #   end
    # end

    # describe ".governance" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         summary: ,
    #         category: ,
    #         role: ,
    #         organization: ,
    #         start: ,
    #         end: ,
    #         keywords: [],
    #         highlights: []
    #       }]
    #     }
    #   end

    #   it "should extract governance data" do
    #     expect(subject.governance).to eq result
    #   end
    # end

    # describe ".service" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         category: ,
    #         organization: ,
    #         position: ,
    #         url: ,
    #         start: ,
    #         end: ,
    #         summary: ,
    #         location: ,
    #         highlights: [],
    #         keywords: []
    #       }]
    #     }
    #   end

    #   it "should extract service data" do
    #     expect(subject.service).to eq result
    #   end
    # end
    
    # describe ".references" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{
    #         name: ,
    #         role: ,
    #         summary: 
    #       }]
    #     }
    #   end

    #   it "should extract references data" do
    #     expect(subject.references).to eq result
    #   end
    # end

    # describe ".disposition" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       travel: 20,
    #       authorization: ,
    #       commitment: [],
    #       remote: true,
    #       relocation: {
    #         willing: true,
    #         destinations: []
    #       }    
    #     }
    #   end

    #   it "should extract disposition data" do
    #     expect(subject.disposition).to eq result
    #   end
    # end
  end
end
