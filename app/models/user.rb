class User < ActiveRecord::Base
  attr_accessor :password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :calorie_cuttoff, presence: true,
  numericality: { greater_than_or_equal_to: 0 }

  has_many :meals

  before_save :encrypt_password
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(username, password)
    user = find_by(username: username)
    if user && user.password_hash ==
        BCrypt::Engine.hash_secret(password, user.password_hash)
      user
    else
      nil
    end
  end
  
  def day_total_calories(date)
    meals.where(meal_date: date).inject(0) { |sum, meal| sum + meal.cal.to_i }
  end
  
  def day_calorie_difference(date)
    day_total_calories(date) - calorie_cuttoff.to_i
  end
  
  def overeaten?(date)
    day_calorie_difference(date) > 0
  end
  
  def undereaten?(date)
    day_calorie_difference(date) <= 0
  end
end
