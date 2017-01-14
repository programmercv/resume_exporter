# encoding: UTF-8
require 'spec_helper'

describe ResumeExporter do
  context "having a public LinkedIn profile html" do
    subject{ ResumeExporter.new(RSpec.root + "fixtures/linkedin_public_profile.html") }
    let(:expected_data){ JSON.parse(File.read(RSpec.root + "fixtures/linkedin_public_profile_result.json")) }

    describe "#name" do
      it "should extract name" do
        expect(subject.name).to eq expected_data["name"]
      end
    end

    describe "#first_name" do
      it "should extract first name" do
        expect(subject.first_name).to eq expected_data["first_name"]
      end
    end

    describe "#last_name" do
      it "should extract last name" do
        expect(subject.last_name).to eq expected_data["last_name"]
      end
    end

    describe "#title" do
      it "should extract title" do
        expect(subject.title).to eq expected_data["title"]
      end
    end

    describe "#picture" do
      it "should extract picture" do
        expect(subject.picture).to eq expected_data["picture"]
      end
    end

    describe "#location" do
      it "extract location" do
        expect(subject.location).to eq expected_data["location"]
      end
    end

    describe "#websites" do
      it "should extract websites" do
        expect(subject.websites[0][:name]).to eq expected_data["websites"][0]["name"]
        expect(subject.websites[0][:link]).to eq expected_data["websites"][0]["link"]
        expect(subject.websites[1][:name]).to eq expected_data["websites"][1]["name"]
        expect(subject.websites[1][:link]).to eq expected_data["websites"][1]["link"]
      end
    end

    describe "#summary" do
      it "should extract summary" do
        expect(subject.summary).to eq expected_data["summary"]
      end
    end

    describe "#experience" do
      it "should extract experience" do
        expect(subject.experience[0][:title]).to eq expected_data["experience"][0]["title"]
        expect(subject.experience[0][:company]).to eq expected_data["experience"][0]["company"]
        expect(subject.experience[0][:location]).to eq expected_data["experience"][0]["location"]
        expect(subject.experience[0][:start_date]).to eq expected_data["experience"][0]["start_date"]
        expect(subject.experience[0][:end_date]).to eq expected_data["experience"][0]["end_date"]
        expect(subject.experience[0][:description]).to eq expected_data["experience"][0]["description"]

        expect(subject.experience[1][:title]).to eq expected_data["experience"][1]["title"]
        expect(subject.experience[1][:company]).to eq expected_data["experience"][1]["company"]
        expect(subject.experience[1][:location]).to eq expected_data["experience"][1]["location"]
        expect(subject.experience[1][:start_date]).to eq expected_data["experience"][1]["start_date"]
        expect(subject.experience[1][:end_date]).to eq expected_data["experience"][1]["end_date"]
        expect(subject.experience[1][:description]).to eq expected_data["experience"][1]["description"]
      end
    end

    describe "#certifications" do
      it "should extract certifications" do
        expect(subject.certifications[0][:name]).to eq expected_data["certifications"][0]["name"]
        expect(subject.certifications[0][:authority]).to eq expected_data["certifications"][0]["authority"]
        expect(subject.certifications[0][:number]).to eq expected_data["certifications"][0]["number"]
        expect(subject.certifications[0][:url]).to eq expected_data["certifications"][0]["url"]
        expect(subject.certifications[0][:start_date]).to eq expected_data["certifications"][0]["start_date"]
        expect(subject.certifications[0][:end_date]).to eq expected_data["certifications"][0]["end_date"]

        expect(subject.certifications[1][:name]).to eq expected_data["certifications"][1]["name"]
        expect(subject.certifications[1][:authority]).to eq expected_data["certifications"][1]["authority"]
        expect(subject.certifications[1][:number]).to eq expected_data["certifications"][1]["number"]
        expect(subject.certifications[1][:url]).to eq expected_data["certifications"][1]["url"]
        expect(subject.certifications[1][:start_date]).to eq expected_data["certifications"][1]["start_date"]
        expect(subject.certifications[1][:end_date]).to eq expected_data["certifications"][1]["end_date"]
      end
    end

    describe "#education" do
      it "should extract education" do          
        expect(subject.education[0][:school]).to eq expected_data["education"][0]["school"]
        expect(subject.education[0][:start_date]).to eq expected_data["education"][0]["start_date"]
        expect(subject.education[0][:end_date]).to eq expected_data["education"][0]["end_date"]
        expect(subject.education[0][:degree]).to eq expected_data["education"][0]["degree"]
        expect(subject.education[0][:field_of_study]).to eq expected_data["education"][0]["field_of_study"]
        expect(subject.education[0][:grade]).to eq expected_data["education"][0]["grade"]
        expect(subject.education[0][:activities_and_societies]).to eq expected_data["education"][0]["activities_and_societies"]
        expect(subject.education[0][:description]).to eq expected_data["education"][0]["description"]

        expect(subject.education[1][:school]).to eq expected_data["education"][1]["school"]
        expect(subject.education[1][:start_date]).to eq expected_data["education"][1]["start_date"]
        expect(subject.education[1][:end_date]).to eq expected_data["education"][1]["end_date"]
        expect(subject.education[1][:degree]).to eq expected_data["education"][1]["degree"]
        expect(subject.education[1][:field_of_study]).to eq expected_data["education"][1]["field_of_study"]
        expect(subject.education[1][:grade]).to eq expected_data["education"][1]["grade"]
        expect(subject.education[1][:activities_and_societies]).to eq expected_data["education"][1]["activities_and_societies"]
        expect(subject.education[1][:description]).to eq expected_data["education"][1]["description"]
      end
    end

    describe "#interests" do
      it "should extract interests" do
        expect(subject.interests[0][:name]).to eq expected_data["interests"][0]["name"]
        expect(subject.interests[1][:name]).to eq expected_data["interests"][1]["name"]
      end
    end

    describe "#skills" do
      it "should extract skills" do
        expect(subject.skills[0][:name]).to eq expected_data["skills"][0]["name"]
        expect(subject.skills[1][:name]).to eq expected_data["skills"][1]["name"]
        expect(subject.skills[2][:name]).to eq expected_data["skills"][2]["name"]
      end
    end

    describe "#languages" do
      it "should extract languages" do
        expect(subject.languages[0][:name]).to eq expected_data["languages"][0]["name"]
        expect(subject.languages[0][:proficiency]).to eq expected_data["languages"][0]["proficiency"]
        expect(subject.languages[1][:name]).to eq expected_data["languages"][1]["name"]
        expect(subject.languages[1][:proficiency]).to eq expected_data["languages"][1]["proficiency"]
        expect(subject.languages[2][:name]).to eq expected_data["languages"][2]["name"]
        expect(subject.languages[2][:proficiency]).to eq expected_data["languages"][2]["proficiency"]
      end
    end

    describe "#volunteer_experiences" do
      it "should extract volunteer_experiences" do
        expect(subject.volunteer_experiences[0][:organization]).to eq expected_data["volunteer_experiences"][0]["organization"]
        expect(subject.volunteer_experiences[0][:role]).to eq expected_data["volunteer_experiences"][0]["role"]
        expect(subject.volunteer_experiences[0][:cause]).to eq expected_data["volunteer_experiences"][0]["cause"]
        expect(subject.volunteer_experiences[0][:start_date]).to eq expected_data["volunteer_experiences"][0]["start_date"]
        expect(subject.volunteer_experiences[0][:end_date]).to eq expected_data["volunteer_experiences"][0]["end_date"]
        expect(subject.volunteer_experiences[0][:description]).to eq expected_data["volunteer_experiences"][0]["description"]

        expect(subject.volunteer_experiences[1][:organization]).to eq expected_data["volunteer_experiences"][1]["organization"]
        expect(subject.volunteer_experiences[1][:role]).to eq expected_data["volunteer_experiences"][1]["role"]
        expect(subject.volunteer_experiences[1][:cause]).to eq expected_data["volunteer_experiences"][1]["cause"]
        expect(subject.volunteer_experiences[1][:start_date]).to eq expected_data["volunteer_experiences"][1]["start_date"]
        expect(subject.volunteer_experiences[0][:end_date]).to eq expected_data["volunteer_experiences"][0]["end_date"]
        expect(subject.volunteer_experiences[1][:description]).to eq expected_data["volunteer_experiences"][1]["description"]
      end
    end

    describe "#awards" do
      it "should extract awards" do
        expect(subject.awards[0][:title]).to eq expected_data["awards"][0]["title"]
        expect(subject.awards[0][:issuer]).to eq expected_data["awards"][0]["issuer"]
        expect(subject.awards[0][:date]).to eq expected_data["awards"][0]["date"]
        expect(subject.awards[0][:description]).to eq expected_data["awards"][0]["description"]

        expect(subject.awards[1][:title]).to eq expected_data["awards"][1]["title"]
        expect(subject.awards[1][:issuer]).to eq expected_data["awards"][1]["issuer"]
        expect(subject.awards[1][:date]).to eq expected_data["awards"][1]["date"]
        expect(subject.awards[1][:description]).to eq expected_data["awards"][1]["description"]
      end
    end

    describe "#courses" do
      it "should extract courses" do
        expect(subject.courses[0][:name]).to eq expected_data["courses"][0]["name"]
        expect(subject.courses[0][:number]).to eq expected_data["courses"][0]["number"]
        expect(subject.courses[1][:name]).to eq expected_data["courses"][1]["name"]
        expect(subject.courses[1][:number]).to eq expected_data["courses"][1]["number"]
      end
    end

    describe "#organizations" do
      it "should extract organizations" do
        expect(subject.organizations[0][:organization]).to eq expected_data["organizations"][0]["organization"]
        expect(subject.organizations[0][:position]).to eq expected_data["organizations"][0]["position"]
        expect(subject.organizations[0][:start_date]).to eq expected_data["organizations"][0]["start_date"]
        expect(subject.organizations[0][:end_date]).to eq expected_data["organizations"][0]["end_date"]
        expect(subject.organizations[0][:notes]).to eq expected_data["organizations"][0]["notes"]

        expect(subject.organizations[1][:organization]).to eq expected_data["organizations"][1]["organization"]
        expect(subject.organizations[1][:position]).to eq expected_data["organizations"][1]["position"]
        expect(subject.organizations[1][:start_date]).to eq expected_data["organizations"][1]["start_date"]
        expect(subject.organizations[1][:end_date]).to eq expected_data["organizations"][1]["end_date"]
        expect(subject.organizations[1][:notes]).to eq expected_data["organizations"][1]["notes"]
      end
    end

    describe "#test_scores" do
      it "should extract test_scores" do
        expect(subject.test_scores[0][:name]).to eq expected_data["test_scores"][0]["name"]
        expect(subject.test_scores[0][:score]).to eq expected_data["test_scores"][0]["score"]
        expect(subject.test_scores[0][:date]).to eq expected_data["test_scores"][0]["date"]

        expect(subject.test_scores[1][:name]).to eq expected_data["test_scores"][1]["name"]
        expect(subject.test_scores[1][:score]).to eq expected_data["test_scores"][1]["score"]
        expect(subject.test_scores[1][:date]).to eq expected_data["test_scores"][1]["date"]
      end
    end

    describe "#patents" do
      it "should extract patents" do
        expect(subject.patents[0][:title]).to eq expected_data["patents"][0]["title"]
        expect(subject.patents[0][:number]).to eq expected_data["patents"][0]["number"]
        expect(subject.patents[0][:status]).to eq expected_data["patents"][0]["status"]
        expect(subject.patents[0][:office]).to eq expected_data["patents"][0]["office"]
        expect(subject.patents[0][:date]).to eq expected_data["patents"][0]["date"]
        expect(subject.patents[0][:url]).to eq expected_data["patents"][0]["url"]
        expect(subject.patents[0][:description]).to eq expected_data["patents"][0]["description"]

        expect(subject.patents[1][:title]).to eq expected_data["patents"][1]["title"]
        expect(subject.patents[1][:number]).to eq expected_data["patents"][1]["number"]
        expect(subject.patents[1][:status]).to eq expected_data["patents"][1]["status"]
        expect(subject.patents[1][:office]).to eq expected_data["patents"][1]["office"]
        expect(subject.patents[1][:date]).to eq expected_data["patents"][1]["date"]
        expect(subject.patents[1][:url]).to eq expected_data["patents"][1]["url"]
        expect(subject.patents[1][:description]).to eq expected_data["patents"][1]["description"]
      end
    end

    describe "#projects" do
      it "should extract projects" do
        expect(subject.projects[0][:name]).to eq expected_data["projects"][0]["name"]
        expect(subject.projects[0][:start_date]).to eq expected_data["projects"][0]["start_date"]
        expect(subject.projects[0][:end_date]).to eq expected_data["projects"][0]["end_date"]
        expect(subject.projects[0][:url]).to eq expected_data["projects"][0]["url"]
        expect(subject.projects[0][:description]).to eq expected_data["projects"][0]["description"]

        expect(subject.projects[1][:name]).to eq expected_data["projects"][1]["name"]
        expect(subject.projects[1][:start_date]).to eq expected_data["projects"][1]["start_date"]
        expect(subject.projects[1][:end_date]).to eq expected_data["projects"][1]["end_date"]
        expect(subject.projects[1][:url]).to eq expected_data["projects"][1]["url"]
        expect(subject.projects[1][:description]).to eq expected_data["projects"][1]["description"]
      end
    end

    describe "#publications" do
      it "should extract publications" do
        expect(subject.publications[0][:title]).to eq expected_data["publications"][0]["title"]
        expect(subject.publications[0][:publisher]).to eq expected_data["publications"][0]["publisher"]
        expect(subject.publications[0][:date]).to eq expected_data["publications"][0]["date"]
        expect(subject.publications[0][:url]).to eq expected_data["publications"][0]["url"]
        expect(subject.publications[0][:description]).to eq expected_data["publications"][0]["description"]
        expect(subject.publications[0][:authors]).to eq expected_data["publications"][0]["authors"]

        expect(subject.publications[1][:title]).to eq expected_data["publications"][1]["title"]
        expect(subject.publications[1][:publisher]).to eq expected_data["publications"][1]["publisher"]
        expect(subject.publications[1][:date]).to eq expected_data["publications"][1]["date"]
        expect(subject.publications[1][:url]).to eq expected_data["publications"][1]["url"]
        expect(subject.publications[1][:description]).to eq expected_data["publications"][1]["description"]
        expect(subject.publications[1][:authors]).to eq expected_data["publications"][1]["authors"]
      end
    end
  end
end
