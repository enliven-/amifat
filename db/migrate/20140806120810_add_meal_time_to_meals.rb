class AddMealTimeToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :meal_time, :string
  end
end
