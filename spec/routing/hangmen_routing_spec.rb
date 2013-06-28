require "spec_helper"

describe HangmenController do
  describe "routing" do

    it "routes to #index" do
      get("/hangmen").should route_to("hangmen#index")
    end

    it "routes to #new" do
      get("/hangmen/new").should route_to("hangmen#new")
    end

    it "routes to #show" do
      get("/hangmen/1").should route_to("hangmen#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hangmen/1/edit").should route_to("hangmen#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hangmen").should route_to("hangmen#create")
    end

    it "routes to #update" do
      put("/hangmen/1").should route_to("hangmen#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hangmen/1").should route_to("hangmen#destroy", :id => "1")
    end

  end
end
