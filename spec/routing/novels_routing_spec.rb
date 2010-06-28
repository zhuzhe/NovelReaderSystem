require 'spec_helper'

describe NovelsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/novels" }.should route_to(:controller => "novels", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/novels/new" }.should route_to(:controller => "novels", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/novels/1" }.should route_to(:controller => "novels", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/novels/1/edit" }.should route_to(:controller => "novels", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/novels" }.should route_to(:controller => "novels", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/novels/1" }.should route_to(:controller => "novels", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/novels/1" }.should route_to(:controller => "novels", :action => "destroy", :id => "1") 
    end
  end
end
