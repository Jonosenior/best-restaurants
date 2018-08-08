class DishesController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:id])
    @dish = @restaurant.dishes.create(dish_params)
  end

  def index
    @dishes = Dish.all
    @dishes = @dishes.where(restaurant_id: params[:restaurant_id]) if params[:restaurant_id]
    # @books = @books.where(author_id: params[:author_id]) if params[:author_id]
  end

end
