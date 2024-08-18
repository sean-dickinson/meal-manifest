# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :meals, dependent: :destroy

  # Get all tags for meals belonging to this user
  # @return [ActiveRecord::Relation<ActsAsTaggableOn::Tag>]
  def meal_tags
    ActsAsTaggableOn::Tag
      .where(taggings: {taggable_type: "Meal", context: "tags"})
      .joins(:taggings)
      .joins("INNER JOIN meals on taggable_id = meals.id")
      .where("meals.user_id = ?", id)
  end
end
