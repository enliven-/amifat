require 'rails_helper'

RSpec.describe Meal, type: :model do

  it "responds to attributes - name, calories, cal, meal_time, meal_date" do
    meal = Meal.new
    expect(meal).to respond_to(:name)
    expect(meal).to respond_to(:calories)
    expect(meal).to respond_to(:cal)
    expect(meal).to respond_to(:meal_time)
    expect(meal).to respond_to(:meal_date)
  end

  it "has valid factories" do
    meal = build :meal
    expect(meal).to be_valid
  end

  it "saves string date as a date object" do
    date = "08/07/2014".to_date
    meal = Meal.new(name: 'xyz', cal: '1200', meal_date_text: '08/07/2014',
                    meal_time_text: '12:00 pm')

    expect(meal).to be_valid

    meal.save!
    expect(meal.meal_date).to eq(date)
  end

  it "saves string time in second since midnight" do
    meal = Meal.new(name: 'xyz', cal: '1200', meal_date_text: '08/07/2014',
                    meal_time_text: '12:00 pm')

    expect(meal).to be_valid

    meal.save!
    expect(meal.meal_time).to eq(43200)
  end
end
