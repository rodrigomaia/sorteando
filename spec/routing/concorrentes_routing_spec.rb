require "spec_helper"

describe SorteiosController do
  describe "routing" do

    it "routes to #new" do
      get("/sorteios/1/concorrentes/new").should route_to("concorrentes#new", :sorteio_id => "1")
    end

    it "routes to #create" do
      post("/sorteios/1/concorrentes").should route_to("concorrentes#create", :sorteio_id => "1")
    end

    it "routes to #destroy" do
      delete("/sorteios/1/concorrentes/2").should route_to("concorrentes#destroy", :sorteio_id => "1", :id => "2")
    end

    it "routes to #index" do
      get("/sorteios/1/concorrentes").should_not be_routable
    end

    it "routes to #edit" do
      get("/sorteios/1/concorrentes/edit").should_not be_routable
    end

    it "routes to #update" do
      put("/sorteios/1/concorrentes/1").should_not be_routable
    end
  end
end
