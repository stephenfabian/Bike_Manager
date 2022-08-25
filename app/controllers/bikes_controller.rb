class BikesController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @bikes = Bike.all
    @shops = Shop.all #might not need
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
  end

  # def create
  #   bike = Bike.new({
  #     name: params[:bike][:name],
  #     full_suspension: params[:bike][:full_suspension],
  #     travel_length: params[:bike][:travel_length],
  #     })

  #   bike.save

  #   redirect_to '/bikes'
  # end
end