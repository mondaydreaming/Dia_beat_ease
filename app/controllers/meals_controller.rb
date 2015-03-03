class MealsController < ApplicationController

  def index
    @meals = @current_user.meals
    sum = 0

  end

  def new
    @meal = Meal.new
  end

  def create
    # binding.pry
    meal = @current_user.meals.create(meal_params)
    redirect_to meal
  end

  def show
    # binding.pry
    @meal = Meal.find params[:id]
    # @meal.total_carbs = @meal.foods.sum(:carbs).round(1)

    # the code below will only assign a value to total_carbs if the user visits the show page of a meal
    # sum = 0
    # @meal.foods.each do |food|
    #   sum += (food.carbs * food.quantity)
    #   sum
    # end

    # @meal.update_attribute(:total_carbs, sum.round)

    # respond_to do |format|
    #   format.json { render :json => @meal.foods }
    # # end
  end

  # def complete
  #   @meal = Meal.find params[:meal_id]
  # end
  # refer to meal model for calculate_total_carbs method to calculate total meal carbs.

  # might not need this, as it is the foods themselves that will be edited
  def edit
    @meal = Meal.find params[:id]
  end

  def update
    meal = Meal.find params[:id]
    meal.update meal_params
    redirect_to meal_path
  end

  def destroy
    meal = Meal.find params[:id]
    meal.destroy
    redirect_to meal_path
  end

  private
  def meal_params
    params.require(:meal).permit(:meal_time, :meal_date, :user_id, :total_carbs)
  end

end
