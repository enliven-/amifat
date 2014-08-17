class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html
  
  before_filter :authenticate_user
    
  def index
    @meals = current_user.meals
  end

  def new
    @meal = Meal.new
  end

  def edit
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    
    respond_to do |format|
      if @meal.save
        @meals = current_user.meals
        format.js
      else
        format.js { render(partial: "application/failure") }
      end
    end
  end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        @meals = current_user.meals
        format.js
      else
        format.js { render(partial: "application/failure") }
      end
    end
  end

  def destroy
    @meal.destroy
    @meals = current_user.meals
    respond_to do |format|
      format.js
    end
  end
  
  def filters
    @meals = current_user.meals
             .within_date(params[:filter][:date][:from], params[:filter][:date][:to])
             .within_time(params[:filter][:time][:from], params[:filter][:time][:to])
    render json: { meals_table: render_to_string(partial: 'meals_table',
      locals: { meals: @meals }) }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = Meal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meal_params
    params.require(:meal).permit(:name, :calories, :meal_time_text,
                                 :meal_date_text, :meal_time, :meal_date)
  end
end
