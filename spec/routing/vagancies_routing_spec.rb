require "rails_helper"

RSpec.describe VaganciesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vagancies").to route_to("vagancies#index")
    end


    it "routes to #show" do
      expect(:get => "/vagancies/1").to route_to("vagancies#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/vagancies").to route_to("vagancies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vagancies/1").to route_to("vagancies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vagancies/1").to route_to("vagancies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vagancies/1").to route_to("vagancies#destroy", :id => "1")
    end

  end
end
