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


  describe 'User Story 22 - Parent Delete from Parent Index' do 
    it 'visit Shop Index, next to every shop theres link to delete that shop, when you click link, returned to Shop Index, where deleted shop isnt shown' do

      @shop1 = Shop.create!(name: "OutofStyle Shop", rentals: TRUE, rank: 8)
      @shop2 = Shop.create!(name: "Worstshop", rentals: TRUE, rank: 8)

      @bike1 = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop1.id)
      @bike2 = Bike.create!(name: "Pivot", full_suspension: TRUE, travel_length: 150, shop_id: @shop2.id)

      visit ("/shops")
      expect(page).to have_button("Delete OutofStyle Shop")
      expect(page).to have_button("Delete Worstshop")

      click_button("Delete OutofStyle Shop")
      expect(current_path).to eq("/shops")

      expect(page).to_not have_content("OutofStyle Shop")
    end

  end
end