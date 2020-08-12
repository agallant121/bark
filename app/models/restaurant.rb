class Restaurant < ApplicationRecord
  has_one_attached :image

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

  def self.sort_by_average
    # select distinct name from restaurants
    # left join reviews on restaurants.id = reviews.restaurant_id
    # order by (reviews.rating) desc;

    # Restaurant.select(:name).joins(:reviews).order.(('reviews.rating') :desc)
  end
end
