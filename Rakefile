require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :console do
  exec 'irb -r pipe_dream -I ./lib'
end

task :default => :spec
