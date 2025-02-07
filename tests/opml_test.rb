require "test-unit"
require "nokogiri"
require "rexml/validation/relaxng"
require "rexml/parsers/treeparser"
require "rexml/document"

class OPMLTest < Test::Unit::TestCase
  def self.basic_tests(schema_name)
    schema_source = File.read(File.join(__dir__, "../#{schema_name}.rng"))

    Dir[File.join(__dir__, "positive/**/*.opml")].each do |opml|
      test "#{schema_name}: #{opml} with Nokogiri" do
        schema = Nokogiri::XML::RelaxNG.new(schema_source)
        doc = Nokogiri::XML::Document.parse(File.read(opml))
        assert_empty schema.validate(doc)
      end

      test "#{schema_name}: #{opml} with REXML" do
        omit "REXML issue?"
        validator = REXML::Validation::RelaxNG.new(schema_source)
        parser = REXML::Parsers::TreeParser.new(File.read(opml))
        parser.add_listener(validator)
        parser.parse
      end
    end

    Dir[File.join(__dir__, "negative/**/*.opml")].each do |opml|
      test "#{schema_name}: #{opml}" do
        schema = Nokogiri::XML::RelaxNG.new(schema_source)
        doc = Nokogiri::XML::Document.parse(File.read(opml))
        assert_not_empty schema.validate(doc)
      end

      test "#{schema_name}: #{opml} with REXML" do
        validator = REXML::Validation::RelaxNG.new(schema_source)
        parser = REXML::Parsers::TreeParser.new(File.read(opml))
        parser.add_listener(validator)
        assert_raise(REXML::Validation::ValidationException) { parser.parse }
      end
    end
  end

  basic_tests("schema")
  basic_tests("schemaex")
end
