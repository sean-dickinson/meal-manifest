# == Schema Information
#
# Table name: meals
#
#  id         :uuid             not null, primary key
#  name       :string
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
  pending "add some examples to (or delete) #{__FILE__}"
end
