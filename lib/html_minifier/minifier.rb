# encoding: UTF-8

require "execjs"
require "multi_json"

module HtmlMinifier

  class Minifier
    Error = ExecJS::Error

    # SourcePath = File.expand_path("../../js/minify.js", __FILE__)

    def initialize(options = nil)
      if options.instance_of? Hash then
        @options = options.dup
      elsif options.nil?
        @options = nil
      else
        raise 'Unsupported option for HtmlMinifier: ' + options.to_s
      end
      # @context = ExecJS.compile(File.open(SourcePath, "r:UTF-8").read)
    end

    def minify(source)
      source
      # source = source.respond_to?(:read) ? source.read : source.to_s
      # if @options.nil? then
      #   js = "return minify(#{MultiJson.dump(source)});"
      # else
      #   js = "return minify(#{MultiJson.dump(source)}, #{MultiJson.dump(@options)});"
      # end
      # @context.exec js
    end
  end

  def self.minify(source, options = nil)
    Minifier.new(options).minify(source)
  end
  
end
