class DishesController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:id])
    @dish = @restaurant.dishes.create(dish_params)
  end

  def index
    @dishes = Dish.all
    @dishes = @dishes.where(restaurant_id: params[:restaurant_id]) if params[:restaurant_id]
  end

end
