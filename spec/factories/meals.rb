# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meal do
    name "MyMeal"
    calories "800"
    meal_date { Date.today }
    meal_time 43200
    user
    after(:create) { |meal| meal.send(:save_meal_time_in_seconds) }
    after(:create) { |meal| meal.send(:save_meal_date_as_date_object) }
  end
  
  factory :invalid_meal, class: Meal do
    name "MyMeal"
    meal_date { Date.today }
    meal_time 43200
    user
  end
end
