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
