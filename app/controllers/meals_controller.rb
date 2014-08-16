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

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json  
  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    
    respond_to do |format|
      if @meal.save
        format.js
      else
        format.js { render(partial: "application/failure") }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.js
      else
        format.js { render(partial: "application/failure") }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.js
    end
  end
  
  def filters
    css_class = ''
    @meals = current_user.meals
             .within_date(params[:filter][:date][:from], params[:filter][:date][:to])
             .within_time(params[:filter][:time][:from], params[:filter][:time][:to])
            
    # if params[:filter][:date][:from] == params[:filter][:date][:to]
  #     css_class = @meals.inject(0) {|s, c| s + c.cal.to_i } > current_user.calorie_cuttoff.to_i ? 'danger' : 'success'
  #   end
    render json: { meals_table: render_to_string(partial: 'meals_table', locals: { meals: @meals }), css_class: css_class }
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
