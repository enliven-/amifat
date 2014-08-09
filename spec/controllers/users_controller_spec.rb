require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    it "creates a new User" do
      expect {
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it "assigns a newly created user as @user" do
      post :create, user: attributes_for(:user)

      expect(assigns(:user)).to be_a(User)
      expect(assigns(:user)).to be_persisted
    end
  end

end
