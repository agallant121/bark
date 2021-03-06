class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(review: Review.find(params[:review]), user: current_user)
    if favorite == []
      #create the favorite
      Favorite.create(review: Review.find(params[:review]), user: current_user)
      @favorite_exists = true
    else
      #delete the favorite
      favorite.destroy_all
      @favorite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
