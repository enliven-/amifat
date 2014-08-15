require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  
  before(:each) do
    @user = create :user, username: 'foobar'
    sign_in @user
  end

  describe "GET index" do
    it "populates an array of meals of signed in user" do
      user1 = create :user, username: 'foo'
      user2 = create :user, username: 'bar'
      meal1 = create :meal, user: user1
      meal2 = create :meal, user: user2
      
      sign_in(user1)
      
      get :index

      expect(response).to be_success
      expect(assigns(:meals)).to include(meal1)
      expect(assigns(:meals)).not_to include(meal2)
    end
  end
  
  describe "GET new" do
    it "assigns a new meal as @meal" do
      xhr :get, :new
      expect(assigns(:meal)).to be_a_new(Meal)
    end
  end
  
  describe "GET edit" do
    it "assigns the requested meal as @meal" do
      meal = create :meal, user: @user
      xhr :get, :edit, id: meal.id
      expect(assigns(:meal)).to eq(meal)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Meal" do
        expect {
          xhr :post, :create, meal: attributes_for(:meal)
        }.to change(Meal, :count).by(1)
      end

      it "assigns a newly created meal as @meal" do
        xhr :post, :create, meal: attributes_for(:meal)
        expect(assigns(:meal)).to be_a(Meal)
        expect(assigns(:meal)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved meal as @meal" do
        xhr :post, :create, meal: attributes_for(:invalid_meal)
        expect(assigns(:meal)).to be_a_new(Meal)
      end

      it "assigned meal is not persisted" do
       xhr :post, :create, meal: attributes_for(:invalid_meal)
        expect(assigns(:meal)).not_to be_persisted
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested meal" do
        meal = create :meal
        xhr :put, :update, id: meal.to_param, meal: attributes_for(:meal, calories: "300")
        meal.reload
        expect(meal.calories).to eql("300")
      end

      it "assigns the requested meal as @meal" do
        meal = create :meal
        xhr :put, :update, id: meal.to_param, meal: attributes_for(:meal, calories: "300")
        expect(assigns(:meal)).to eq(meal)
      end

    end

    describe "with invalid params" do
      it "assigns the meal as @meal" do
        meal = create :meal
        xhr :put, :update, id: meal.to_param, meal: attributes_for(:meal, calories: nil)
        expect(assigns(:meal)).to eq(meal)
      end

      it "does not updates the requested meal" do
        meal = create :meal
        cal = meal.calories
        xhr :put, :update, id: meal.to_param, meal: attributes_for(:meal, calories: nil)
        meal.reload
        expect(meal.calories).to eql(cal)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested meal" do
      meal = create :meal
      expect {
        xhr :delete, :destroy, id: meal.to_param
      }.to change(Meal, :count).by(-1)
    end
  end

end
