require 'rails_helper'

RSpec.describe 'User Story 20, Child Delete' do 
  it 'on Bike show page I see a link to "Delete Bike".  After I click link, redirected to Bike index, and no longer see the Bike' do

      @shop = Shop.create!(name: "Europe Bike Shop", rentals: TRUE, rank: 8)
      @bike = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

      visit "/bikes/#{@bike.id}"
      click_link("Delete #{@bike.name}")

      expect(current_path).to eq("/bikes")
      expect(page).to_not have_content("Santa Cruz")
  end
end