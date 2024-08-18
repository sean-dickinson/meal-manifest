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
require "rails_helper"

RSpec.describe Meal, type: :model do
  context "validations" do
    it "must have a name" do
      meal = build(:meal, name: nil)
      expect(meal).to be_invalid
      expect(meal.errors).to include :name
    end
  end
end
