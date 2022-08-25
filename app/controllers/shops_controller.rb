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

  def create
   shop = Shop.create(name: params[:name])
   redirect_to "/shops"
  end
end