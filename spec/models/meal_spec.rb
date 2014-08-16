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
    expect(meal.save).to be_truthy
  end

  it "saves string date as a date object" do
    date = "08/07/2014".to_date
    meal = create :meal, name: 'xyz', cal: '1200', meal_date_text: '08/07/2014',
                    meal_time_text: '12:00 pm', meal_date: nil

    expect(meal).to be_valid

    meal.save!
    expect(meal.meal_date).to eq(date)
  end

  it "saves string time in second since midnight" do
    meal = create :meal, name: 'xyz', cal: '1200', meal_date_text: '08/07/2014',
                    meal_time_text: '12:00 pm', meal_time: nil

    expect(meal).to be_valid

    meal.save!
    expect(meal.meal_time).to eq(43200)
  end

  it "finds all the meals within time range" do
    user = create :user
    meal1 = create :meal, meal_time_text: '12:00 PM', meal_time: nil, user: user
    meal2 = create :meal, meal_time_text: '1:30 PM',  meal_time: nil, user: user, user: user
    meal3 = create :meal, meal_time_text: '11:00 PM', meal_time: nil, user: user, user: user
    meal4 = create :meal, meal_time_text: '11:00 AM', meal_time: nil, user: user, user: user
    meal5 = create :meal, meal_time_text: '3:00 PM',  meal_time: nil, user: user, user: user

    expect(Meal.within_time("12:00 PM", "3:00 PM")).to include(meal1, meal2, meal5)
    expect(Meal.within_time("12:00 PM", "3:00 PM")).not_to include(meal3, meal4)
  end

  it "finds all the meals within date range" do
    user = create :user
    meal1 = create :meal, meal_date: Date.today, user: user
    meal2 = create :meal, meal_date: (Date.today + 30.days), user: user
    meal3 = create :meal, meal_date: (Date.today + 32.days), user: user
    meal4 = create :meal, meal_date: (Date.today - 2.days), user: user
    meal5 = create :meal, meal_date: (Date.today + 5.days), user: user

    expect(Meal.within_date(Date.today, (Date.today + 30.days))).to include(meal1, meal2, meal5)
    expect(Meal.within_date(Date.today, (Date.today + 30.days))).not_to include(meal3, meal4)
  end

  it "finds all the meals within specific time for between specific period" do
    user = create :user
    meal1 = create :meal, meal_time_text: '12:00 PM', meal_time: nil, meal_date: Date.today, user: user
    meal2 = create :meal, meal_time_text: '1:30 PM',  meal_time: nil, meal_date: (Date.today + 15.days), user: user
    meal3 = create :meal, meal_time_text: '11:00 PM', meal_time: nil, meal_date: (Date.today + 32.days), user: user
    meal4 = create :meal, meal_time_text: '11:00 AM', meal_time: nil, meal_date: (Date.today - 2.days), user: user
    meal5 = create :meal, meal_time_text: '3:00 PM',  meal_time: nil, meal_date: (Date.today + 31.days), user: user

    expect(Meal.within_time("12:00 PM", "3:00 PM").within_date(Date.today, (Date.today + 30.days))).to include(meal1, meal2)
    expect(Meal.within_time("12:00 PM", "3:00 PM").within_date(Date.today, (Date.today + 30.days))).not_to include(meal3, meal4, meal5)
  end
end
