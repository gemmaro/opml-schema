require "test-unit"
require "nokogiri"

class OPMLTest < Test::Unit::TestCase
  relaxng = File.read(File.join(__dir__, "../schema.rng"))

  Dir[File.join(__dir__, "positive/**/*.opml")].each do |opml|
    test opml do
      schema = Nokogiri::XML::RelaxNG.new(relaxng)
      doc = Nokogiri::XML::Document.parse(File.read(opml))
      assert_empty schema.validate(doc)
    end
  end

  Dir[File.join(__dir__, "negative/**/*.opml")].each do |opml|
    test opml do
      schema = Nokogiri::XML::RelaxNG.new(relaxng)
      doc = Nokogiri::XML::Document.parse(File.read(opml))
      assert_not_empty schema.validate(doc)
    end
  end
end
