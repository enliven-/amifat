# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  Meal.create(name: "breakfast#{n}", cal: '2000', meal_time_text: '10:00 AM',
              meal_date_text: Date.today)
  Meal.create(name: "lunch#{n}", cal: '4000', meal_time_text: "#{1+rand(11)}:00 PM",
              meal_date: Date.today + rand(25).days)
end
