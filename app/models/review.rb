class Review < ApplicationRecord
  has_one_attached :image

  validates_presence_of :rating
  validates_presence_of :comment

  belongs_to :user
  belongs_to :restaurant
end
