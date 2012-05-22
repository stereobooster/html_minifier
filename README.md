# HtmlMinifier
[![Build Status](https://secure.travis-ci.org/stereobooster/html_minifier.png?branch=master)](http://travis-ci.org/stereobooster/html_minifier)

Ruby wrapper for js library [html-minifier](https://github.com/kangax/html-minifier/). If you want pure ruby use [html_press](https://github.com/stereobooster/html_press) 

## Installation

`html_minifier` is available as ruby gem.

    $ gem install html_minifier

Ensure that your environment has a JavaScript interpreter supported by [ExecJS](https://github.com/sstephenson/execjs). Usually, installing therubyracer gem is the best alternative.

## Usage

```ruby
require 'html_minifier'

HtmlMinifier.minify(File.read("source.html"))
```

When initializing `HtmlMinifier`, you can pass options

```ruby
HtmlMinifier::minifier.new( <options> ).minify(source)
# Or
HtmlMinifier.minify(source, <options>)
```

## TODO

 - add Rake task
 - add color reporter. Maybe [colorize](https://github.com/fazibear/colorize)
 - add cli
