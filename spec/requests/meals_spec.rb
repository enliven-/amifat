require 'rails_helper'

RSpec.describe "Meals", :type => :request do
  describe "GET /meals" do
    it "works! (now write some real specs)" do
      get meals_path
      expect(response.status).to be(200)
    end
  end
end
