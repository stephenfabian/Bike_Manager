require 'rails_helper'
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
RSpec.describe 'Shop Bikes Index page' do
  describe 'As a visitor' do
   describe 'When I visit /parents/:parent_id/child_table_name' do
     it 'Then I see each Child that is associated with that Parent with each Childs attributes' do
        shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
        
        bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: shop.id)
        bike2 = Bike.create!(name: "FuelEx", full_suspension: TRUE, travel_length: 130, shop_id: shop.id)

        visit "/shops/#{shop.id}/bikes"
        save_and_open_page
# require 'pry'; binding.pry
        expect(page).to have_content(bike.name)
        expect(page).to have_content(bike.full_suspension)
        expect(page).to have_content(bike.travel_length)
        expect(page).to have_content(bike.shop_id)
        expect(page).to have_content(bike.created_at)
        expect(page).to have_content(bike.updated_at)

        expect(page).to have_content(bike2.name)
        expect(page).to have_content(bike2.full_suspension)
        expect(page).to have_content(bike2.travel_length)
        expect(page).to have_content(bike2.shop_id)
        expect(page).to have_content(bike2.created_at)
        expect(page).to have_content(bike2.updated_at)
        

      end
    end
  end
end