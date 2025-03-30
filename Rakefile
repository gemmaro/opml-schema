require 'rake/testtask'
require "tempfile"

task :default => [:build, :test]

desc "Builds OPML specification file"
task :build do
  sh "xsltproc", "--output", "spec.tmp.html",
     "specgen.xsl",
     "schema.rng"
  File.write("spec.html", "<!doctype html>#{File.read("spec.tmp.html")}")
end

Rake::TestTask.new do |t|
  t.test_files = FileList["tests/opml_test.rb"]
  t.deps << "schemaex.rng"
end

def rng_to_rnc(source, target)
  sh "trang", "-I", "rng", "-O", "rnc", source, target
end

file("schema.rnc" => "schema.rng") { |t| rng_to_rnc(t.source, t.name) }
file("schemaex.rnc" => "schemaex.rng") { |t| rng_to_rnc(t.source, t.name) }

file "schemaex.rng" => ["schema.rng", "exgen.xsl"] do |t|
  source, stylesheet, = t.sources
  Tempfile.create do |tmp|
    sh "xsltproc", "--output", tmp.path, stylesheet, source
    sh "xmllint", "--output", t.name, "--format", tmp.path
  end
end
