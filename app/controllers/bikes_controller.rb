class BikesController < ApplicationController
  def index
    # require 'pry'; binding.pry
    # @bikes = Bike.all
    @bikes = Bike.where(full_suspension: "true")

    @shops = Shop.all #might not need
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    redirect_to("/bikes/#{@bike.id}")
  end

  def bike_params
    params.permit(:name, :full_suspension, :travel_length)
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to("/bikes")
  end
end