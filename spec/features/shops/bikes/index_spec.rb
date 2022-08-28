require 'rails_helper'

RSpec.describe 'Shop Bikes Index page' do
  describe 'As a visitor' do
   describe 'When I visit /parents/:parent_id/child_table_name' do
     it 'Then I see each Child that is associated with that Parent with each Childs attributes' do
        shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
        
        bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: shop.id)
        bike2 = Bike.create!(name: "FuelEx", full_suspension: TRUE, travel_length: 130, shop_id: shop.id)

        visit "/shops/#{shop.id}/bikes"

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

  describe 'User Story 16, Sort Parents Children in Alphabetical Order by name' do
    it 'A Shops Bikes page has link that takes me back to the same page, but the bikes are sorted alphabetically' do

      @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)

      @bike = Bike.create!(name: "A-Bike", full_suspension: FALSE, travel_length: 150, shop_id: @shop.id)
      @bike2 = Bike.create!(name: "B-Bike", full_suspension: FALSE, travel_length: 156, shop_id: @shop.id)
      @bike3 = Bike.create!(name: "C-Bike", full_suspension: TRUE, travel_length: 98, shop_id: @shop.id)

      visit "/shops/#{@shop.id}/bikes"
      expect(page).to have_link("Sort Bikes Alphabetically")

      click_on("Sort Bikes Alphabetically")
      expect(current_path).to eq("/shops/#{@shop.id}/bikes")

      expect("A-Bike").to appear_before("B-Bike")
      expect("B-Bike").to appear_before("C-Bike")
    end
  end

#   

# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.

  describe 'User Story 21, Display Records Over a Given Threshold' do
    it 'on a Shops Bike Index page, theres a form that allows me to input a number value' do

      @shop = Shop.create!(name: "Europe Bike Shop", rentals: TRUE, rank: 8)
      @bike1 = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 180, shop_id: @shop.id)
      @bike2 = Bike.create!(name: "Pivot", full_suspension: TRUE, travel_length: 100, shop_id: @shop.id)

      visit "/shops/#{@shop.id}/bikes"
      expect(page).to have_field("Input number")
      fill_in 'Input number', with: 150

      expect(page).to have_button("Only return records with more than (input number)mm of travel length")
      click_button("Only return records with more than (input number)mm of travel length")

      expect(current_path).to eq("/shops/#{@shop.id}/bikes")
      
      expect(page).to have_content("Santa Cruz")
      expect(page).to_not have_content("Pivot")
    end
  end
end