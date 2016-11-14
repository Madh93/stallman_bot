require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task default: :spec

desc "Documentation generation tool"
task :doc do
  sh "bundle exec yardoc"
end
