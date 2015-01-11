require "rails_helper"

RSpec.describe TaskDetailsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/task_details").to route_to("task_details#index")
    end

    it "routes to #new" do
      expect(:get => "/task_details/new").to route_to("task_details#new")
    end

    it "routes to #show" do
      expect(:get => "/task_details/1").to route_to("task_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/task_details/1/edit").to route_to("task_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/task_details").to route_to("task_details#create")
    end

    it "routes to #update" do
      expect(:put => "/task_details/1").to route_to("task_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_details/1").to route_to("task_details#destroy", :id => "1")
    end

  end
end
