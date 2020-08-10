class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.all.paginate(page: params[:page], per_page: 5)
  end
end
