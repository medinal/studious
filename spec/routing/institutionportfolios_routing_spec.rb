require "rails_helper"

RSpec.describe InstitutionportfoliosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/institutionportfolios").to route_to("institutionportfolios#index")
    end

    it "routes to #new" do
      expect(:get => "/institutionportfolios/new").to route_to("institutionportfolios#new")
    end

    it "routes to #show" do
      expect(:get => "/institutionportfolios/1").to route_to("institutionportfolios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/institutionportfolios/1/edit").to route_to("institutionportfolios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/institutionportfolios").to route_to("institutionportfolios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/institutionportfolios/1").to route_to("institutionportfolios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/institutionportfolios/1").to route_to("institutionportfolios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/institutionportfolios/1").to route_to("institutionportfolios#destroy", :id => "1")
    end

  end
end
