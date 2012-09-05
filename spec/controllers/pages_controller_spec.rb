require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
    @base_title = "ENSU Library Catalogue"
  end

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "should have correct title" do
      get 'home'
      response.should have_selector("title", :content => "#{@base_title} | Home")
    end

    it "should have a non-blank body" do
      get 'home'
      # Body should not match the given regular expression (ie. body should not be empty)
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

    it "should have correct title" do
      get 'contact'
      response.should have_selector("title", :content => "#{@base_title} | Contact")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end

    it "should have correct title" do
      get 'about'
      response.should have_selector("title", :content => "#{@base_title} | About")
    end
  end
end