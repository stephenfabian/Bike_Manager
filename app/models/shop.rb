class Shop < ApplicationRecord
  has_many :bikes


  validates :name, presence: true
  validates :rank, presence: true

  def count_bikes
    self.bikes.count
  end

   #QUESTION 2 - HOW TO EVALUATE PRESENCE OF BOOLEANS?
  # validates :rentals, presence: true

  def records_over_threshold(params)
    @bike = Bike.where("travel_length > #{params.to_i}")
  end
end