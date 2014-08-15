class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.js
      else
        format.js { render(partial: "application/failure") }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :calorie_cuttoff)
  end
end
