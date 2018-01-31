class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :dashboard]
  
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end
  
  def show
    @comment = Comment.new
  end
  
  def feeds
    @recent_restaurants = Restaurant.recent_ten
    @recent_comments = Comment.recent_ten
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
