class Restaurant < ApplicationRecord
  has_many_attached :image

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

  def sort_by_average
    # Restaurant
    # .select('name')
    # .join(:reviews)
    # .order('avg(reviews.rating) desc')

    select
  end
end
