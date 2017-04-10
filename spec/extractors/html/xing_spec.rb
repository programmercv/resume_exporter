# "encoding" => UTF-8
require 'spec_helper'

describe Extractor::Xing do
  context "having a public LinkedIn profile html" do
    let(:doc) { File.open(RSpec.root + "fixtures/xing.html") { |f| Nokogiri::HTML(f, nil, 'utf-8') } }
    subject{ Extractor::Xing.new(doc) }

    describe ".basics" do
      let(:result) do
        {
          "name"=>"John Doe",
          "image"=>"profile.jpg"
        }
      end

      it "should extract basics data" do
        expect(subject.basics).to eq result
      end
    end

    describe ".employment" do
      let(:result) do
        [
          {
            "position"=>"Software Developer",
            "employer"=>"Company Name",
            "url"=>"http://url.com",
            "startDate"=>"09/2014",
            "endDate"=>"10/2016"
          }
        ]
      end

      it "should extract employment data" do
        expect(subject.employment).to eq result
      end
    end

    describe ".education" do
      let(:result) do
        [
          {
            "institution"=>"Institution",
            "fieldOfStudy"=>"Fieldofstuy, degree",
            "summary"=>"Description",
            "startDate"=>"03/2015",
            "endDate"=>"05/2019"
          }
        ]
      end

      it "should extract education data" do
        expect(subject.education).to eq result
      end
    end

    describe ".languages" do
      let(:result) do
        [
          {
            "language" => "Deutsch",
            "level" => "Muttersprache"
          },
          { 
            "language" => "Englisch",
            "level" => "Fließend"
          },
          { 
            "language" => "Französisch",
            "level" => "Grundkenntnisse"
          }
        ]
      end

      it "should extract languages data" do
        expect(subject.languages).to eq result
      end
    end

    describe ".qualifications" do
      let(:result) do
        [
          {
            "title" => "Qualification 1"
          },
          {
            "title" => "Qualification 2"
          } 
        ]        
      end

      it "should extract qualifications data" do
        expect(subject.qualifications).to eq result
      end
    end

    describe ".recognition" do
      let(:result) do
        [
          {
            "title" => "Test",
            "url" => "http://link.de",
            "startDate" => "2013"
          }
        ]
      end

      it "should extract recognition data" do
        expect(subject.recognition).to eq result
      end
    end

    describe ".affiliations" do
      let(:result) do
        [
          {
            "organization" => "test"
          }
        ]
      end

      it "should extract affiliations data" do
        expect(subject.affiliations).to eq result
      end
    end

    describe ".interests" do
      let(:result) do
        [
          {
            "name" => "Test"
          }
        ]
      end

      it "should extract interests data" do
        expect(subject.interests).to eq result
      end
    end
  end
end
