# encoding: UTF-8
require 'spec_helper'

describe ResumeExporter do
  context "having a public Xing profile html" do
    subject{ ResumeExporter.new(RSpec.root + "fixtures/xing_profile.html") }
    let(:expected_data){ JSON.parse(File.read(RSpec.root + "fixtures/xing_profile_result.json")) }

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

    describe "#experience" do
      it "should extract experience" do
        expect(subject.experience[0][:title]).to eq expected_data["experience"][0]["title"]
        expect(subject.experience[0][:company]).to eq expected_data["experience"][0]["company"]
        expect(subject.experience[0][:start_date]).to eq expected_data["experience"][0]["start_date"]
        expect(subject.experience[0][:end_date]).to eq expected_data["experience"][0]["end_date"]

        expect(subject.experience[1][:title]).to eq expected_data["experience"][1]["title"]
        expect(subject.experience[1][:company]).to eq expected_data["experience"][1]["company"]
        expect(subject.experience[1][:start_date]).to eq expected_data["experience"][1]["start_date"]
        expect(subject.experience[1][:end_date]).to eq expected_data["experience"][1]["end_date"]
      end
    end

    describe "#education" do
      it "should extract education" do          
        expect(subject.education[0][:school]).to eq expected_data["education"][0]["school"]
        expect(subject.education[0][:start_date]).to eq expected_data["education"][0]["start_date"]
        expect(subject.education[0][:end_date]).to eq expected_data["education"][0]["end_date"]
        expect(subject.education[0][:description]).to eq expected_data["education"][0]["description"]

        expect(subject.education[1][:school]).to eq expected_data["education"][1]["school"]
        expect(subject.education[1][:start_date]).to eq expected_data["education"][1]["start_date"]
        expect(subject.education[1][:end_date]).to eq expected_data["education"][1]["end_date"]
        expect(subject.education[1][:description]).to eq expected_data["education"][1]["description"]
      end
    end

    describe "#interests" do
      it "should extract interests" do
        expect(subject.interests[0][:name]).to eq expected_data["interests"][0]["name"]
        expect(subject.interests[1][:name]).to eq expected_data["interests"][1]["name"]
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
  end
end
