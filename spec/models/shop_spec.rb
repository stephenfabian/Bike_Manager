require 'rails_helper'

RSpec.describe Shop, type: :model do
  it {should have_many :bikes}

  it { should validate_presence_of (:name)}
  it { should validate_presence_of (:rank)}
  it { should validate_presence_of (:rentals)} 

  describe 'count_bikes' do
    it 'tests that method can count number of bikes for a shop' do
      @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
      @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
      @bike2 = Bike.create!(name: "WeakBike", full_suspension: TRUE, travel_length: 90, shop_id: @shop.id)

      expect(@shop.count_bikes).to eq(2)
    end
  end

    it 'test for records_over_threshold' do 

      params = 100
      @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
      @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
      @bike1 = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 170, shop_id: @shop.id)
      @bike2 = Bike.create!(name: "WeakBike", full_suspension: TRUE, travel_length: 90, shop_id: @shop.id)

      expect(@shop.records_over_threshold(100)).to eq([@bike, @bike1])
    end
end