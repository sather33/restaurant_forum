class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :dashboard, :favorite, :unfavorite, :like, :unlike]
  
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

  def like
    @restaurant.likes.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unlike
    likes = Like.where(restaurant: @restaurant, user: current_user).first
    likes.destroy
    redirect_back(fallback_location: root_path)
  end

  def followships
    @followships = Followship.all
    @users = User.where.not(id: current_user)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
