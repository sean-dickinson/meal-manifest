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
FactoryBot.define do
  factory :meal do
    user
    name { Faker::Food.dish }
    notes { Faker::Boolean.boolean ? Faker::Lorem.paragraph : nil }
    source { Faker::Boolean.boolean ? Faker::Internet.url : Faker::Book.title }
  end
end
