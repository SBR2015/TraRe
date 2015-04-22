require "rails_helper"

RSpec.describe ResumesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resumes").to route_to("resumes#index")
    end

    it "routes to #new" do
      expect(:get => "/resumes/new").to route_to("resumes#new")
    end

    it "routes to #show" do
      expect(:get => "/resumes/1").to route_to("resumes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resumes/1/edit").to route_to("resumes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resumes").to route_to("resumes#create")
    end

    it "routes to #update" do
      expect(:put => "/resumes/1").to route_to("resumes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resumes/1").to route_to("resumes#destroy", :id => "1")
    end

  end
end
