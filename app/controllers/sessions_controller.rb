class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      @meals = current_user.meals

      respond_to do |format|
        format.js
      end     
    else
      respond_to do |format|
        format.js { render(partial: 'application/failure')}
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
