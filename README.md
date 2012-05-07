# HtmlMinifier
[![Build Status](https://secure.travis-ci.org/stereobooster/html_minifier.png?branch=master)](http://travis-ci.org/stereobooster/html_minifier)

Ruby wrapper for [html-minifier](https://github.com/kangax/html-minifier/).

## Installation

`html_minifier` is available as ruby gem.

    $ gem install html_minifier

Ensure that your environment has a JavaScript interpreter supported by [ExecJS](https://github.com/sstephenson/execjs). Usually, installing therubyracer gem is the best alternative.

## Usage

```ruby
require 'html_minifier'

HtmlMinifier.minify(File.read("source.html"))
```

Or you can use it with rake

```ruby
require "html_minifier/task"
HtmlMinifier::Task.new :html do |t|
  t.pattern = 'static/**/*.html'
end
```

When initializing `HtmlMinifier`, you can pass options

```ruby
HtmlMinifier::minifier.new( <options> ).minify(source)
# Or
HtmlMinifier.minify(source, <options>)
```

## TODO

 - add more tests
 - add color reporter. Maybe [colorize](https://github.com/fazibear/colorize)
 - add cli
