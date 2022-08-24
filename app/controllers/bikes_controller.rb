class BikesController < ApplicationController
  def index
    # @tasks = ['Task 1', 'Task 2', 'Task 3']
    @bikes = Bikes.all
  end

  def new
  end

  def create
    bike = Bike.new({
      name: params[:bike][:name],
      full_suspension: params[:bike][:full_suspension],
      travel_length: params[:bike][:travel_length],
      })

    bike.save

    redirect_to '/bikes'
  end
end