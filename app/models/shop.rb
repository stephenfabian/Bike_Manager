class Shop < ApplicationRecord
  has_many :bikes

  validates :name, presence: true
  validates :rank, presence: true
  validates :rentals, :inclusion => {:in => [true, false]}
  
  def count_bikes
    self.bikes.count
  end

  def records_over_threshold(params)
    @bike = Bike.where("travel_length > #{params.to_i}")
  end
end