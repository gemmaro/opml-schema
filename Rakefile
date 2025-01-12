require 'rake/testtask'
require "tempfile"

task :default => [:build, :test]

desc "Builds OPML specification file"
task :build do
  sh "xsltproc specgen.xsl schema.rng > spec.html"
end

Rake::TestTask.new do |t|
  t.test_files = FileList["tests/opml_test.rb"]
  t.deps << "schemaex.rng"
end

file "schema.rnc" => "schema.rng" do |t|
  sh "trang", "-I", "rng", "-O", "rnc", t.source, t.name
end

file "schemaex.rng" => ["schema.rng", "exgen.xsl"] do |t|
  source, stylesheet, = t.sources
  Tempfile.create do |tmp|
    sh "xsltproc", "--output", tmp.path, stylesheet, source
    sh "xmllint", "--output", t.name, "--format", tmp.path
  end
end
