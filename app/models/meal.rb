class Meal < ActiveRecord::Base

  attr_accessor :meal_time_text, :meal_date_text

  alias_attribute :cal, :calories

  private

  before_save :save_meal_time_as_seconds
  def save_meal_time_as_seconds
    self.meal_time = meal_time_text.to_time.seconds_since_midnight.to_i rescue nil
  end

  before_save :save_meal_date_as_date_object
  def save_meal_date_as_date_object
    self.meal_date = meal_date_text.to_date rescue nil
  end
end
