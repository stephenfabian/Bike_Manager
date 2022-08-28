require 'rails_helper'

RSpec.describe 'destroying a shop' do
  describe 'User Story 19 - Parent Delete' do
    it 'can delete Shop from Shop#show page, shop and its bike records are deleted, redirect to shop index, shop shows as deleted' do
      @shop = Shop.create!(name: "Europe Bike Shop", rentals: TRUE, rank: 8)

      @bike1 = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
      @bike2 = Bike.create!(name: "Pivot", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

      visit "/shops/#{@shop.id}"
      click_button("Delete")

      expect(current_path).to eq("/shops")
      expect(page).to_not have_content("Europe Bike Shop")
    end
  end
end