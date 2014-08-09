class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id

      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.js
    end
  end
end
