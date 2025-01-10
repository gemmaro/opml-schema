require 'rake/testtask'

task :default => [:build, :test]

desc "Builds OPML specification file"
task :build do
  sh "xsltproc specgen.xsl schema.rng > spec.html"
end

Rake::TestTask.new { |t| t.test_files = FileList["tests/opml_test.rb"] }
