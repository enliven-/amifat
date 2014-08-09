# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "foo@bar.com"
    password "password"
    calorie_cuttoff '120000'
    name 'Foo Bar'
  end
end
