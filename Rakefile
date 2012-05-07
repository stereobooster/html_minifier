require "bundler/gem_tasks"

[:build, :install, :release].each do |task_name|
  Rake::Task[task_name].prerequisites << :spec
end

require 'submodule'
class HtmlMinifierSubmodule  < Submodule::Task
    # def test
    # end
    # def after_pull
    # end
end
HtmlMinifierSubmodule.new

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

task :default => :spec

#desc "Generate code coverage"
# RSpec::Core::RakeTask.new(:coverage) do |t|
  # t.rcov = true
  # t.rcov_opts = ["--exclude", "spec"]
# end
