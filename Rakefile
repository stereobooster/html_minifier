require "bundler/gem_tasks"

[:build, :install, :release].each do |task_name|
  Rake::Task[task_name].prerequisites << :spec
end

require 'submodule'
Submodule::Task.new do |t|
  t.branch = "gh-pages"

  t.test do
    js = []
    js << File.open(File.expand_path("../lib/js/console.js", __FILE__), "r:UTF-8").read
    %w{htmlparser htmllint htmlminifier}.each do |i|
      js << File.open("src/#{i}.js", "r:UTF-8").read
    end
    js << File.open("tests/qunit.js", "r:UTF-8").read.gsub('}( (function() {return this;}.call()) ));', '}( this ));')
    js << File.open(File.expand_path("../spec/qunit_helper.js", __FILE__), "r:UTF-8").read
    %w{minify_test lint_test}.each do |i|
      js << File.open("tests/#{i}.js", "r:UTF-8").read
    end

    js = js.join("\n")
    js = "function globe(){#{js};return this};var global = new globe();"

    require "execjs"
    context = ExecJS.compile js
    result = context.exec "return global.QUnit.result();"
    if result["fail"] > 0 && result["assertions"].respond_to?(:each)
      puts "Failures:"
      i = 1
      result["assertions"].each do |test, details|
        puts "  #{i}) #{test}"
        puts "    Failure/Error: #{details[0]}"
        puts "      expected: #{details[1].inspect}"
        puts "           got: #{details[2].inspect}"
        i+=1
      end
    end
    #  (#{result['pass_asserions']}) (#{result['fail_asserions']})
    puts "Pass: #{result['pass']}, Fail: #{result['fail']}"
    if result["fail"] > 0
      abort
    end
  end

  t.after_pull do
    %w{htmlparser htmllint htmlminifier}.each do |i|
      cp "vendor/html-minifier/src/#{i}.js", "lib/js/#{i}.js"
      sh "git add lib/js/#{i}.js"
    end
  end
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

task :default => [:spec, "submodule:test"]

#desc "Generate code coverage"
# RSpec::Core::RakeTask.new(:coverage) do |t|
  # t.rcov = true
  # t.rcov_opts = ["--exclude", "spec"]
# end
