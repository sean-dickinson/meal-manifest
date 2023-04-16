class Meal < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :user

  class << self
    # @param [String] search_query
    # @return [ActiveRecord::Relation<Meal>]
    def search(search_query = "")
      if search_query.blank?
        Meal.all
      else
        matched_tag_ids = Meal.tagged_with(search_query).pluck(:"meals.id")
        Meal.where("name ILIKE ?", "%#{search_query}%")
          .or(Meal.where(id: matched_tag_ids))
          .distinct
      end
    end
  end
end
