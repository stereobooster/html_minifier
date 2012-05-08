# encoding: UTF-8
require "html_minifier"

class TestLogger
  attr_accessor :logs

  def initialize
    @logs = []
  end

  def info message
    @logs <<  message
  end
end

describe "HtmlMinifier" do
  
  it "it works" do
    html = '<p>foo</p>'
    HtmlMinifier.minify(html).should eq html
  end

  it "it logs" do
    html = '<p>foo</p>'
    log = TestLogger.new
    HtmlMinifier.minify(html, :log => log).should eq html
    log.logs.length.should eq 1
  end
end
