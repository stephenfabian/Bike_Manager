class ShopBikesController < ApplicationController
  
  def index 
    # require 'pry'; binding.pry
    @shop = Shop.find(params[:id])
    @bikes = Bike.all
    @bikes = @shop.records_over_threshold(params[:input_number]) if !params[:input_number].blank?
  end

  def new
    @shop = Shop.find(params[:id])
  end

end


