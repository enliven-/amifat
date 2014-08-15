ENV["RAILS_ENV"] ||= 'test'
require 'rubygems'
require File.expand_path("../../config/environment", __FILE__)
require 'factory_girl'
require 'rails_helper'

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end
  
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  def sign_out
    session[:user_id] = nil
  end
end
