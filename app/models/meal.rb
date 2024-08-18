# == Schema Information
#
# Table name: meals
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  notes      :text
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_meals_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Meal < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :user

  # Validations
  validates :name, presence: true

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
