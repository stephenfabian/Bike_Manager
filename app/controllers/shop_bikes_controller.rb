class ShopBikesController < ApplicationController
  
  def index
    @shop = Shop.find(params[:id])
      @shops = Shop.all.order(created_at: :desc)
    if params[:id]
        if !params[:input_number].blank?
      # require 'pry'; binding.pry
          @bikes = @shop.records_over_threshold(params[:input_number])
        else 
          @bikes = Bike.all
        end
    else
      @shops = Shop.all.order(created_at: :desc)
    end
  end
end


