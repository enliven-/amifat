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

  it "finds all the meals within time range" do
    meal1 = create :meal, meal_time_text: '12:00 PM'
    meal2 = create :meal, meal_time_text: '1:30 PM'
    meal3 = create :meal, meal_time_text: '11:00 PM'
    meal4 = create :meal, meal_time_text: '11:00 AM'
    meal5 = create :meal, meal_time_text: '3:00 PM'

    expect(Meal.within_time("12:00 PM", "3:00 PM")).to include(meal1)
    expect(Meal.within_time("12:00 PM", "3:00 PM")).to include(meal2)
    expect(Meal.within_time("12:00 PM", "3:00 PM")).to include(meal5)
    expect(Meal.within_time("12:00 PM", "3:00 PM")).not_to include(meal3)
    expect(Meal.within_time("12:00 PM", "3:00 PM")).not_to include(meal4)
  end

  it "finds all the meals within time range" do
    meal1 = create :meal, meal_date: Date.today
    meal2 = create :meal, meal_date: (Date.today + 30.days)
    meal3 = create :meal, meal_date: (Date.today + 32.days)
    meal4 = create :meal, meal_date: (Date.today - 2.days)
    meal5 = create :meal, meal_date: (Date.today + 5.days)

    expect(Meal.within_date(Date.today, (Date.today + 30.days))).to include(meal1)
    expect(Meal.within_date(Date.today, (Date.today + 30.days))).to include(meal2)
    expect(Meal.within_date(Date.today, (Date.today + 30.days))).to include(meal5)
    expect(Meal.within_date(Date.today, (Date.today + 30.days))).not_to include(meal3)
    expect(Meal.within_date(Date.today, (Date.today + 30.days))).not_to include(meal4)
  end
end
