class DishesController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:id])
    @dish = @restaurant.dishes.create(dish_params)
  end
  
end
