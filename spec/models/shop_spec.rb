require 'rails_helper'

RSpec.describe Shop, type: :model do
  it {should have_many :bikes}
    it { should validate_presence_of (:name)}
    it { should validate_presence_of (:rank)}

    #QUESTION 2 - HOW TO EVALUATE PRESENCE OF BOOLEANS?
    # it { should validate_presence_of (:rentals)} 


    #QUESTION 1
      it 'test for records_over_threshold' do #multiple bikes with travel length  > 100, or no bikes?

        params = 100
        @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
        @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
        @bike2 = Bike.create!(name: "WeakBike", full_suspension: TRUE, travel_length: 90, shop_id: @shop.id)

        expect(@shop.records_over_threshold(100)).to eq([@bike])
      end
end