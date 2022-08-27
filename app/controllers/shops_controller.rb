class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    # binding.pry
    @shop = Shop.find(params[:id])
  end

  def children_index
    @shop = Shop.find(params[:id])
    @bikes = Bike.all
  end

  def new
  end

  def new_bike
    @shop = Shop.find(params[:id])
  end

  def create
  #  shop = Shop.create(name: params[:name])
  # used before we created .shop_params
    shop = Shop.create(shop_params)
    redirect_to "/shops"
  end

  def create_bike
   @shop = Shop.find(params[:id])
   @bike = @shop.bikes.create!(bike_params)
   redirect_to "/shops/#{@shop.id}/bikes"
    # @bikes = Shop.find(params[:id]).bikes
  end
  
  def edit
    @shop = Shop.find(params[:id])
  end
  
  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to "/shops/#{@shop.id}"
  end

  def bike_params
    params.permit(:name, :full_suspension, :travel_length)
  end

private
  def shop_params
    params.permit(:name, :rank, :rentals)
  end



end