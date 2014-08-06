require 'rails_helper'

RSpec.describe MealsController, :type => :controller do

  describe "GET index" do
    it "populates an array of meals" do
      meal = create :meal
      get :index

      expect(response).to be_success
      expect(assigns(:meals)).to include(meal)
    end
  end

  # describe "GET show" do
  #   it "assigns the requested meal as @meal" do
  #     meal = Meal.create! valid_attributes
  #     get :show, {:id => meal.to_param}, valid_session
  #     expect(assigns(:meal)).to eq(meal)
  #   end
  # end

  describe "GET new" do
    it "assigns a new meal as @meal" do
      get :new
      expect(assigns(:meal)).to be_a_new(Meal)
    end
  end

  # describe "GET edit" do
  #   it "assigns the requested meal as @meal" do
  #     meal = Meal.create! valid_attributes
  #     get :edit, {:id => meal.to_param}, valid_session
  #     expect(assigns(:meal)).to eq(meal)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Meal" do
  #       expect {
  #         post :create, {:meal => valid_attributes}, valid_session
  #       }.to change(Meal, :count).by(1)
  #     end

  #     it "assigns a newly created meal as @meal" do
  #       post :create, {:meal => valid_attributes}, valid_session
  #       expect(assigns(:meal)).to be_a(Meal)
  #       expect(assigns(:meal)).to be_persisted
  #     end

  #     it "redirects to the created meal" do
  #       post :create, {:meal => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Meal.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved meal as @meal" do
  #       post :create, {:meal => invalid_attributes}, valid_session
  #       expect(assigns(:meal)).to be_a_new(Meal)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:meal => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested meal" do
  #       meal = Meal.create! valid_attributes
  #       put :update, {:id => meal.to_param, :meal => new_attributes}, valid_session
  #       meal.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested meal as @meal" do
  #       meal = Meal.create! valid_attributes
  #       put :update, {:id => meal.to_param, :meal => valid_attributes}, valid_session
  #       expect(assigns(:meal)).to eq(meal)
  #     end

  #     it "redirects to the meal" do
  #       meal = Meal.create! valid_attributes
  #       put :update, {:id => meal.to_param, :meal => valid_attributes}, valid_session
  #       expect(response).to redirect_to(meal)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the meal as @meal" do
  #       meal = Meal.create! valid_attributes
  #       put :update, {:id => meal.to_param, :meal => invalid_attributes}, valid_session
  #       expect(assigns(:meal)).to eq(meal)
  #     end

  #     it "re-renders the 'edit' template" do
  #       meal = Meal.create! valid_attributes
  #       put :update, {:id => meal.to_param, :meal => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested meal" do
  #     meal = Meal.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => meal.to_param}, valid_session
  #     }.to change(Meal, :count).by(-1)
  #   end

  #   it "redirects to the meals list" do
  #     meal = Meal.create! valid_attributes
  #     delete :destroy, {:id => meal.to_param}, valid_session
  #     expect(response).to redirect_to(meals_url)
  #   end
  # end

end
