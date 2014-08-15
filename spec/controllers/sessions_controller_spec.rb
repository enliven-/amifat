require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  
  describe "GET new" do
    it "responds successfully" do
      xhr :get, :new
      expect(response).to be_success
    end
  end
  
  describe "POST create" do
    it "signs in the user" do
      user = create :user, username: 'foobar', password: 'passwors'
      xhr :post, :create, username: 'foobar', password: 'passwors'

      expect(current_user).to eql(user)
    end
    
    it 'fetches all the meals for user' do
      user = create :user, username: 'foobar', password: 'passwors'
      meal = create :meal, user: user
      xhr :post, :create, username: 'foobar', password: 'passwors'
      
      expect(assigns(:meals)).to include(meal)
    end
  end
end
