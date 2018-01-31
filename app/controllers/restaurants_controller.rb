class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :dashboard, :favorite, :unfavorite]
  
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

  def favorite
    @restaurant.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    favorites = Favorite.where(restaurant: @restaurant, user: current_user).first
    favorites.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
