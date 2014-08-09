class Meal < ActiveRecord::Base
  attr_accessor :meal_time_text, :meal_date_text
  alias_attribute :cal, :calories

  def self.within_time(from, to)
    from = from.to_time.seconds_since_midnight.to_i
    to = to.to_time.seconds_since_midnight.to_i
    where(meal_time: (from..to))
  end

  def self.within_date(from, to)
    from = from.to_date
    to = to.to_date
    where(meal_date: (from..to))
  end

  def meal_time_to_s
    meal_time.present? ? Time.at(meal_time).strftime("%I:%M %p") : nil
  end

  def meal_date_to_s
    meal_date.present? ? meal_date.strftime("%m/%d/%Y") : nil
  end


  private

  before_save :save_meal_time_in_seconds
  def save_meal_time_in_seconds
    self.meal_time ||= meal_time_text.to_time.seconds_since_midnight.to_i
  end

  before_save :save_meal_date_as_date_object
  def save_meal_date_as_date_object
    self.meal_date ||= meal_date_text.to_date
  end
end
