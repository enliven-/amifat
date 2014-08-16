# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ankush = User.create(username: 'ankush', calorie_cuttoff: '6000', password: 'password')
bhushan = User.create(username: 'bhushan', calorie_cuttoff: '5000', password: 'password')
viksit = User.create(username: 'viksit', calorie_cuttoff: '7000', password: 'password')

meals = [
  ['Idli', '450'],
  ['Medu Wada', '850'],
  ['Wada Sambar', '1000'],
  ['Aloo Paratha',  '600'],
  ['Dahi bhalla', '700'],
  ['Cheese Pizza', '1000'],
  ['Burger' , '800']
]

meal = meals.sample

20.times do 
  meal = meals.sample
  Meal.create name: meal[0],
  calories: meal[1],
  meal_time_text: "#{rand(23)}: #{rand(59)}",
  meal_date: (Date.today + rand(29).days),
  user: User.all.sample
end