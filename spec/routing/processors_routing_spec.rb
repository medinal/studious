require "rails_helper"

RSpec.describe ProcessorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/processors").to route_to("processors#index")
    end

    it "routes to #new" do
      expect(:get => "/processors/new").to route_to("processors#new")
    end

    it "routes to #show" do
      expect(:get => "/processors/1").to route_to("processors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/processors/1/edit").to route_to("processors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/processors").to route_to("processors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/processors/1").to route_to("processors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/processors/1").to route_to("processors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/processors/1").to route_to("processors#destroy", :id => "1")
    end

  end
end
