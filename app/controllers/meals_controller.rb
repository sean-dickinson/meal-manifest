class MealsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_meal, only: %i[show edit update destroy]

  # GET /meals or /meals.json
  def index
    @pagy, @meals = pagy(filtered_meals)
  end

  # GET /meals/1 or /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals or /meals.json
  def create
    @meal = current_user.meals.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to meals_url, notice: "Meal was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1 or /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to meals_url, notice: "Meal was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1 or /meals/1.json
  def destroy
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to meals_url, notice: "Meal was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Meal was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = current_user.meals.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meal_params
    params.require(:meal).permit(:name, :notes, :source, :tag_list)
  end

  def filtered_meals
    current_user.meals.search(search_query)
  end

  def search_query
    @query = params[:query]
  end
end
