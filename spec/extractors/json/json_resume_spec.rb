# encoding: UTF-8
require 'spec_helper'

describe Extractor::JsonResume do
  context "having a JsonResume json file" do
    let(:doc) { File.open(RSpec.root + "fixtures/jsonresume.json") { |f| JSON.parse(f.read, symbolize_names: true) } }
    subject{ Extractor::JsonResume.new(doc) }

    # describe ".meta" do
    #   let(:result) do
    #     meta: {
    #         format: ,
    #         version: 
    #     }
    #   end

    #   it "should extract meta data" do
    #     expect(subject.meta).to eq result
    #   end
    # end

    # describe ".basics" do
    #   let(:result) do
    #     {
    #       name: ,
    #       label: ,
    #       image: ,
    #       summary: ,
    #       contact: {
    #         email: ,
    #         phone: ,
    #         website: ,
    #         location: ,
    #         social: [{
    #           network: ,
    #           user: ,
    #           url: 
    #         }]
    #       }
    #     }
    #   end

    #   it "should extract basics data" do
    #     expect(subject.basics).to eq result
    #   end
    # end

    # describe ".employment" do
    #   let(:result) do
    #     {
    #       summary: ,
    #       history: [{          
    #         employer: ,
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

    #   it "should extract employment data" do
    #     expect(subject.employment).to eq result
    #   end
    # end

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
