# encoding: UTF-8
require "html_minifier"

describe "HtmlMinifier" do
  
  it "it works" do
    html = '<p>foo</p>'
    HtmlMinifier.minify(html).should eq html
  end

end
