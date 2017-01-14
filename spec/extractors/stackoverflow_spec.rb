# encoding: UTF-8
require 'spec_helper'

describe ResumeExporter do
  context "having a public Stackoverflow profile html" do
    subject{ ResumeExporter.new(RSpec.root + "fixtures/stackoverflow.html") }
    let(:expected_data){ JSON.parse(File.read(RSpec.root + "fixtures/stackoverflow_result.json")) }

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

    describe "#open_source_projects" do
      it "should extract open_source_projects" do
        expect(subject.open_source_projects[0][:name]).to eq expected_data["open_source_projects"][0]["name"]
        expect(subject.open_source_projects[0][:start_date]).to eq expected_data["open_source_projects"][0]["start_date"]
        expect(subject.open_source_projects[0][:end_date]).to eq expected_data["open_source_projects"][0]["end_date"]
        expect(subject.open_source_projects[0][:url]).to eq expected_data["open_source_projects"][0]["url"]
        expect(subject.open_source_projects[0][:description]).to eq expected_data["open_source_projects"][0]["description"]

        expect(subject.open_source_projects[1][:name]).to eq expected_data["open_source_projects"][1]["name"]
        expect(subject.open_source_projects[1][:start_date]).to eq expected_data["open_source_projects"][1]["start_date"]
        expect(subject.open_source_projects[1][:end_date]).to eq expected_data["open_source_projects"][1]["end_date"]
        expect(subject.open_source_projects[1][:url]).to eq expected_data["open_source_projects"][1]["url"]
        expect(subject.open_source_projects[1][:description]).to eq expected_data["open_source_projects"][1]["description"]
      end
    end

    describe "#technologies" do
      it "should extract technologies" do
        expect(subject.technologies[0][:name]).to eq expected_data["technologies"][0]["name"]
        expect(subject.technologies[1][:name]).to eq expected_data["technologies"][1]["name"]
      end
    end

  end
end
