require 'rails_helper'

# User Story 20, Child Delete 

# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

RSpec.describe 'User Story 20, Child Delete' do 
  it 'on Bike show page I see a link to "Delete Bike".  After I click link, redirected to Bike index, and no longer see the Bike' do

      @shop = Shop.create!(name: "Europe Bike Shop", rentals: TRUE, rank: 8)

      @bike = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

      visit "/bikes/#{@bike.id}"
      save_and_open_page
      click_button("Delete #{@bike.name}")

      expect(current_path).to eq("/bikes")
      expect(page).to_not have_content("Santa Cruz")
  end
end