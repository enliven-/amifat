class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.js
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :calorie_cuttoff, :name)
  end
end