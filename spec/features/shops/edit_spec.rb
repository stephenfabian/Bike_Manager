require 'rails_helper'

RSpec.describe 'the shop edit feature' do    
  describe 'User Story 12, Parent Update' do
    it 'on shop show page, there is a link for Update Shop, which takes you to /shops/#{@shop.id}/edit, 
    theres a form to edit the shops attributes.  After form is filled out, redirected to that shops show page, and new info is there' do

      @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
      visit "/shops/#{@shop.id}"
      
      expect(page).to have_link("Update Shop")

      click_on("Update Shop")
      expect(current_path).to eq("/shops/#{@shop.id}/edit")

      fill_in 'Name', with: 'Coolest Shop'
      fill_in 'Rank', with: 45
      fill_in 'rentals', with: TRUE
      click_button 'Submit Changes'

      expect(current_path).to eq("/shops/#{@shop.id}")
      expect(page).to have_content('Coolest Shop')
      expect(page).to have_content(45)
      expect(page).to have_content(TRUE)
    end
  end
end
