require 'rails_helper'

RSpec.describe 'User Story 13, Parent Child Creation' do
  describe 'when I visit Shop/:id/bikes' do
    it 'I see a link to add a new bike for that shop, link takes me to /shops/#{@shop.id}/bikes/new,
    theres a form to fill in attributes for new bike, new bike info gets posted to/shops/#{@shop.id}/bikes' do

      @shop = Shop.create!(name: "MichiganShop", rentals: TRUE, rank: 88)
      @bike = Bike.create!(name: "MiRipper", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

      visit "/shops/#{@shop.id}/bikes"
      expect(page).to have_link("Add New Bike for #{@shop.name}")

      click_link("Add New Bike for #{@shop.name}")
      expect(current_path).to eq("/shops/#{@shop.id}/bikes/new")

      fill_in 'Name', with: 'UPshredder'
      select(TRUE, :from => "full_suspension")
      fill_in 'Travel length', with: 300
      click_button 'Create Bike'

      expect(current_path).to eq("/shops/#{@shop.id}/bikes")
      expect(page).to have_content('UPshredder')
      expect(page).to have_content(TRUE)
      expect(page).to have_content(300)
    end
  end
end