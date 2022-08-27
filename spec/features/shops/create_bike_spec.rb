require 'rails_helper'
# As a visitor

# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child

RSpec.describe 'User Story 13, Parent Child Creation' do
  it 'when I visit Shop/bikes, I see a link to add a new bike for that shop, link takes me to /shops/#{@shop.id}/bikes/new,
   theres a form to fill in attributes for new bike, new bike info gets posted to/shops/#{@shop.id}/bikes' do

    @shop = Shop.create!(name: "MichiganShop", rentals: TRUE, rank: 88)
    @bike = Bike.create!(name: "MiRipper", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

    visit "/shops/#{@shop.id}/bikes"
    expect(page).to have_link("Add New Bike for #{@shop.name}")

    click_link("Add New Bike for #{@shop.name}")
    expect(current_path).to eq("/shops/#{@shop.id}/bikes/new")
    save_and_open_page

    fill_in 'Name', with: 'UPshredder'
    fill_in 'Full suspension', with: TRUE
    fill_in 'Travel length', with: 300
    click_button 'Create Bike'

    expect(current_path).to eq("/shops/#{@shop.id}/bikes")
    expect(page).to have_content('UPshredder')
    expect(page).to have_content(TRUE)
    expect(page).to have_content(300)
  end
end