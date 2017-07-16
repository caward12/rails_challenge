class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  # def new
    # respond_to do |format|
    #   format.js {render layout: false}
    # end
  # end

  def create
    user = current_user
    restaurant = user.restaurants.new(restaurant_params)
    if restaurant.save
      render partial: 'restaurant', locals: {restaurant: restaurant}, layout: false
    else
      render root_path
    end
  end

private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :city, :state, :zip)
  end
end