class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
