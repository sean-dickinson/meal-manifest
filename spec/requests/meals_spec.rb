require "rails_helper"

RSpec.describe "Meals", type: :request do
  describe "GET /meals" do
    it "shows all the user's meals" do
      user = create(:user)
      sign_in user
      meals = create_list(:meal, 3, user:)

      get meals_path

      expect(response).to have_http_status(200)
      meals.each do |meal|
        expect(response.body).to include(meal.name)
      end
    end

    it "filters the meals by name based on the search" do
      user = create(:user)
      sign_in user
      meal_that_should_appear = create(:meal, user:, name: "Chicken Alfredo")
      meal_that_should_not_appear = create(:meal, user:, name: "Spaghetti")

      get meals_path, params: {query: "Chick"}

      expect(response).to have_http_status(200)
      expect(response.body).to include(meal_that_should_appear.name)
      expect(response.body).not_to include(meal_that_should_not_appear.name)
    end
  end

  describe "DELETE /meals/:id" do
    it "deletes the meal and redirects to the index" do
      user = create(:user)
      sign_in user

      meals = create_list(:meal, 3, user:)
      meal_to_delete = meals.last

      delete meal_path(meal_to_delete)

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(meals_path)
    end

    it "deletes the meal and renders the turbo stream to remove it" do
      user = create(:user)
      sign_in user

      meals = create_list(:meal, 3, user:)
      meal_to_delete = meals.last

      delete meal_path(meal_to_delete), as: :turbo_stream

      expect(response).to have_http_status(200)
      expect(response).to have_turbo_stream(action: :remove, target: dom_id(meal_to_delete))
    end
  end
end
