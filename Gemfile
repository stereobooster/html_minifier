source "http://rubygems.org"

# Specify your gem's dependencies in gemspec
gemspec

# Depend on defined ExecJS runtime
execjs_runtimes = {
  "RubyRacer" => "therubyracer",
  "RubyRhino" => "therubyrhino",
  "Mustang" => "mustang"
}

if ENV["EXECJS_RUNTIME"] && execjs_runtimes[ENV["EXECJS_RUNTIME"]]
  gem execjs_runtimes[ENV["EXECJS_RUNTIME"]], :group => :development
  if execjs_runtimes[ENV["EXECJS_RUNTIME"]] == "therubyracer"
    gem 'libv8', '~> 3.11.8', :group => :development
  end
end

