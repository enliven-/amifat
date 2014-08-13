class User < ActiveRecord::Base
  attr_accessor :password

  validate :username, presence: true, uniqueness: true
  validate :password, presence: true, on: :create
  validate :calorie_cuttoff, presence: true

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
end
