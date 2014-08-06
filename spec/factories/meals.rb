# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meal do
    name "MyMeal"
    calories "800"
    meal_date { Date.today }
    meal_time 43200
  end
end
