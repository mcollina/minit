require "spec_helper"

describe LinksController do
  describe "routing" do
    
    it "recognizes and generates #new" do
      { :get => "/links/new" }.should route_to(:controller => "links", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/links/1" }.should route_to(:controller => "links", :action => "show", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/links" }.should route_to(:controller => "links", :action => "create") 
    end
    
  end
end
