class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html
    
  def index
    @meals = Meal.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  def show
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
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end
  
  def filters
    @meals = Meal
             .within_time(params[:filter][:time][:from], params[:filter][:time][:to])
             .within_date(params[:filter][:date][:from], params[:filter][:date][:to])
    render json: { meals_table: render_to_string(partial: 'meals_table', locals: { meals: @meals }) }
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
