class Shop < ApplicationRecord
  # require 'pry'; binding.pry
  has_many :bikes
  def records_over_threshold(params)
    @bike = Bike.where("travel_length > ?", params)
  end
end