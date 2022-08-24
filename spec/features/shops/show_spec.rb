require 'rails_helper'

RSpec.describe 'the shops show page' do #USER STORY 2
#As a visitor
#When I visit '/parents/:id'
#Then I see the parent with that id including the parent's attributes:
#- data from each column that is on the parent table
  it 'displays the shop title' do

    shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
    visit "/shops/#{shop.id}"
    
    expect(page).to have_content(shop.id)
    expect(page).to have_content(shop.name)
    expect(page).to have_content(shop.rank)
    expect(page).to have_content(shop.rentals)
    expect(page).to have_content(shop.created_at)
    expect(page).to have_content(shop.updated_at)

  end


end