class ShopsController < ApplicationController

  def index 
    @shops = Shop.all.order(created_at: :desc)
    @bikes = Bike.all
    @bikes = @shop.records_over_threshold(params[:input_number]) if !params[:input_number].blank?
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
  end

  def create
    Shop.create(shop_params)
    redirect_to "/shops"
  end

  def create_bike
   @shop = Shop.find(params[:id])
   @bike = @shop.bikes.create!(bike_params)
   redirect_to "/shops/#{@shop.id}/bikes"
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

  def destroy
    @shop = Shop.find(params[:id])
    @shop.bikes.destroy_all
    @shop.destroy
    redirect_to "/shops"
  end

private
  def shop_params
    params.permit(:name, :rank, :rentals)
  end
end