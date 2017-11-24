class RestaurantsController < ApplicationController
  #before_action :authenticate_user!

  before_action :set_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  # def show
  #   #@restaurant = Restaurant.find(params[:id])
  # end




  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  
end
