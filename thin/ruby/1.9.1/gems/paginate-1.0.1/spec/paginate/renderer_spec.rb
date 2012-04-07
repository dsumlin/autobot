require "spec_helper"

describe Paginate::Renderer do
  before do
    Paginate.configure do |config|
      config.param_name = :page
      config.size  = 10
    end

    I18n.locale = :en

    @renderer = Paginate::Renderer.new({
      :collection => Array.new(11),
      :page => 1,
      :fullpath => "/some/path"
    })
  end

  specify { @renderer.render.should be_html_safe }

  it "should parse simple url" do
    @renderer.options[:url] = "/some/path"
    @renderer.url_for(1).should == "/some/path?page=1"
  end

  it "should parse url with page param" do
    @renderer.options[:url] = "/some/path?page=3"
    @renderer.url_for(1).should == "/some/path?page=1"
  end

  it "should parse url with page as first param" do
    @renderer.options[:url] = "/some/path?page=3&a=1&b=2&c=3"
    @renderer.url_for(1).should == "/some/path?a=1&amp;b=2&amp;c=3&amp;page=1"
  end

  it "should parse url with page as last param" do
    @renderer.options[:url] = "/some/path?a=1&b=2&c=3&page=3"
    @renderer.url_for(1).should == "/some/path?a=1&amp;b=2&amp;c=3&amp;page=1"
  end

  it "should parse url with page param in the middle" do
    @renderer.options[:url] = "/some/path?a=1&b=2&page=3&c=3"
    @renderer.url_for(1).should == "/some/path?a=1&amp;b=2&amp;c=3&amp;page=1"
  end

  it "should parse url with page as arbitrary string" do
    @renderer.options[:url] = "/some/path?a=1&b=2&c=3&page=abc"
    @renderer.url_for(1).should == "/some/path?a=1&amp;b=2&amp;c=3&amp;page=1"
  end

  it "should escape url from blocks" do
    @renderer.options[:url] = proc {|page| "/some/path/#{page}?a=1&b=2"}
    @renderer.url_for(1).should == "/some/path/1?a=1&amp;b=2"
  end
end
