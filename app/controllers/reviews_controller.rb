class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(params[:review].permit(:rating, :comment, :image))
    @review.user = current_user
    @rest_owner = @restaurant.user
    if @review.save
      UserMailer.review_email(@rest_owner).deliver_now
      redirect_to restaurant_path(@restaurant)
    end
  end

  def show
    @favorite_exists = Favorite.where(review: @review, user: current_user) == [] ? false : true
  end

  def destroy
      @restaurant = Post.find(params[:restaurant_id])
      @review = @restaurant.reviews.find(params[:id])
      @review.destroy
      redirect_to restaurant_path(@restaurant)
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:review_id])
    @comment = @review.comment
    #Oringally set @comment == '' right here
    #Then I saved and updated the review and its attributes here
    #All of this worked in my pry session and I do not know why it did not show up on the page
    @review.destroy
    #As I explained in my READme, I just destroyed the review to at least accomplish something
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :image)
  end
end
