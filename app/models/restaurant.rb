class Restaurant < ApplicationRecord
  validates_presence_of :name

  belongs_to :user
  has_many :reviews, dependent: :destroy

  def avg_rating
    reviews.average(:rating).round(1)
  end

  def order_reviews
    reviews.order(created_at: :desc)
    # reviews.order("created_at DESC")
  end

  def self.order_places
    order(avg_rating: :desc)
  end
end
