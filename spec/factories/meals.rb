# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meal do
    name "MyMeal"
    calories "800"
    meal_date { Date.today }
    meal_time 43200
    user
  end
  
  factory :invalid_meal, class: Meal do
    name "MyMeal"
    meal_date { Date.today }
    meal_time 43200
    user
  end
end
