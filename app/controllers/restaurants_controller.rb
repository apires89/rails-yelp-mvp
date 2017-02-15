class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show,:edit,:update,:destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
   if  @restaurant.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new
  end
  end



  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def update
    if @restaurant.update(restaurant_params)
     redirect_to restaurant_path(@restaurant)
    else
    render :edit
  end
  end

  def edit
    @restaurant.edit(restaurant_params)
  end

  def show
  end


private

def restaurant_params
  params.require(:restaurant).permit(:name,:address,:phone_number,:category)
end

def set_restaurant
  @restaurant = Restaurant.find(params[:id])
end

end

