require "nokogiri"

ATTRIBUTES = %w(
  name
  first_name
  last_name
  title
  picture
  location
  websites
  summary
  experience
  certifications
  education
  interests
  skills
  languages
  volunteer_experiences
  awards
  courses
  organizations
  test_scores
  patents
  projects
  open_source_projects
  publications
  technologies
)

EXTRACTORS = %w(
  linkedin_public_profile
  linkedin_connection_profile
  xing
  stackoverflow
)


EXTRACTORS.each do |name|
  require "extractors/#{name}"
end

class ResumeExporter
  ATTRIBUTES.each do |attr|
    define_method attr.to_sym do
      result = nil

      EXTRACTORS.each do |name|        
        extractor = Extractor.const_get(classify_name(name)).new(@doc)
        result = extractor.send(attr.to_sym) if extractor.respond_to?(attr.to_sym)
        return result if result && !result.empty?
      end

      result
    end
  end

  def initialize(file_path)
    if File.file?(file_path)
      @doc = File.open(file_path) { |f| Nokogiri::HTML(f, nil, 'utf-8') } 
    else
      raise ArgumentError, "File not found"
    end
  end

  def classify_name(filename)
    filename.to_s.split("_").map{ |i| i[0...1].upcase + i[1..-1] }.join
  end

  def to_json
    require 'json'
    hash = ATTRIBUTES.reduce({}) { |hash, attr| hash[attr.to_sym] = self.send(attr.to_sym); hash }
    JSON.pretty_generate(hash)
  end

  def to_xml
    require 'builder'

    string = ""
    builder = Builder::XmlMarkup.new(:target=> string, :indent=>2)
    builder.resume do |b| 
      ATTRIBUTES.each do |attr|
        result = self.send(attr.to_sym)
        if result.kind_of?(Array)
          b.tag!(attr) do
            result.each do |entry|
              b.tag!("#{attr}_entry") do
                entry.each do |entry_attr, entry_value|
                  b.tag!(entry_attr, entry_value)
                end
              end
            end
          end
        else
          b.tag! attr, result
        end
      end
    end

    string
  end
end