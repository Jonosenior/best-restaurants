class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant added!"
      redirect_to @restaurant
    else
      flash.now[:danger] = "Invalid information."
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "Restaurant deleted."
    redirect_to root_path
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :cuisine)
  end


end
