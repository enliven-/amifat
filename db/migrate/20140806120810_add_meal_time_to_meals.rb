class AddMealTimeToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :meal_time, :integer
    add_column :meals, :meal_date, :date
  end
end
