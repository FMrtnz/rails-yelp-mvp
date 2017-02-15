class RestaurantsController < ApplicationController
before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(resto_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    # @restaurant.save
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @restaurant.update(resto_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def resto_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end



  # afficher une case cochée
