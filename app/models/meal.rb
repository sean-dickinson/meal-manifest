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
  belongs_to :user

  # Validations
  validates :name, presence: true

  class << self
    # @param [String] search_query
    # @return [ActiveRecord::Relation<Meal>]
    def search(search_query = "")
      if search_query.blank?
        base_relation
      else
        base_relation.where("name ILIKE ?", "%#{search_query}%").distinct
      end
    end

    private

    def base_relation
      Meal.all.order(created_at: :desc)
    end
  end
end
