require "spec_helper"

describe SorteiosController do
  describe "routing" do

    it "routes to #sortear" do
      get("/sorteios/1/sortear").should route_to("sorteios#sortear", :id => "1")
    end

    it "routes to #index" do
      get("/sorteios").should route_to("sorteios#index")
    end

    it "routes to #new" do
      get("/sorteios/new").should route_to("sorteios#new")
    end

    it "routes to #edit" do
      get("/sorteios/1/edit").should route_to("sorteios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sorteios").should route_to("sorteios#create")
    end

    it "routes to #update" do
      put("/sorteios/1").should route_to("sorteios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sorteios/1").should route_to("sorteios#destroy", :id => "1")
    end

  end
end
