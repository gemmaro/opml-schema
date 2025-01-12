require "test-unit"
require "nokogiri"

class OPMLTest < Test::Unit::TestCase
  def self.basic_tests(schema_name)
    schema_source = File.read(File.join(__dir__, "../#{schema_name}.rng"))

    Dir[File.join(__dir__, "positive/**/*.opml")].each do |opml|
      test "#{schema_name}: #{opml}" do
        schema = Nokogiri::XML::RelaxNG.new(schema_source)
        doc = Nokogiri::XML::Document.parse(File.read(opml))
        assert_empty schema.validate(doc)
      end
    end

    Dir[File.join(__dir__, "negative/**/*.opml")].each do |opml|
      test "#{schema_name}: #{opml}" do
        schema = Nokogiri::XML::RelaxNG.new(schema_source)
        doc = Nokogiri::XML::Document.parse(File.read(opml))
        assert_not_empty schema.validate(doc)
      end
    end
  end

  basic_tests("schema")
  basic_tests("schemaex")
end
