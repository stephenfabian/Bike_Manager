require 'rails_helper'

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
RSpec.describe 'the Shop Index sorted by Most Recently Created' do #USER STORY 6
  describe 'As a visitor' do
    describe 'When I visit the parent index' do
      it 'I see that records are ordered by most recently created first' do

        shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8, created_at: 2022-8-23)
        shop2 = Shop.create!(name: "Evo", rentals: FALSE, rank: 7, created_at: 2022-8-21)
        # require 'pry'; binding.pry
        bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: shop.id)
        bike2 = Bike.create!(name: "FuelEx", full_suspension: TRUE, travel_length: 130, shop_id: shop2.id)


        # let(:this) { "<li>Andrea</li>" }
        # let(:that) { "<li>Luis</li>" }

          visit '/shops'
          save_and_open_page

        # expect(this).to appear_before(that)

      end
    end
  end
end

        describe 'And next to each of the records I see when it was created' 

  
