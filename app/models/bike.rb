class Bike < ApplicationRecord
  belongs_to :shop

  validates :name, presence: true
  validates :travel_length, presence: true
  # validates :full_suspension, presence: true or false
  # validates :full_suspension, inclusion: [true, false]
end