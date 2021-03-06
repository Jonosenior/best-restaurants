class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurant_pins = @restaurants.map { |r| [r.name, r.address, r.latitude, r.longitude] }
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

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:success] = "Restaurant updated!"
    else
      flash.now[:danger] = "Invalid information."
      render edit
    end
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
