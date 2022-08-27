require 'rails_helper'
# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe 'User Story 14' do
  it 'on Bike Show page, theres a link to update that Bike, takes me to a form, 
  after I complete form Im taken back to the Bike show page which displays the updated info' do

    @shop = Shop.create!(name: "OhioShop", rentals: TRUE, rank: 600)
    @bike = Bike.create!(name: "HardTail", full_suspension: FALSE, travel_length: 2, shop_id: @shop.id)


    visit "/bikes/#{@bike.id}"
    expect(page).to have_link("Update Bike")

    click_link("Update Bike")
    expect(current_path).to eq("/bikes/#{@bike.id}/edit")

    fill_in 'Name', with: 'Newest Santa Cruz'
    save_and_open_page
    fill_in 'Full suspension', with: TRUE
    fill_in 'Travel length', with: 160
    click_button 'Update Bike'

    expect(current_path).to eq("/bikes/#{@bike.id}")
    expect(page).to have_content('Newest Santa Cruz')
    expect(page).to have_content(TRUE)
    expect(page).to have_content(160)


  end
end