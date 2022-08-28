require 'rails_helper'

# make bikes have a foreign key id


RSpec.describe 'the bikes show page' do #USER STORY 2

  it 'When I visit /bikes/:id, page displays the bike title and bike attributes' do

    @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
    @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

    visit "/bikes/#{@bike.id}"
    
    expect(page).to have_content(@bike.id)
    expect(page).to have_content(@bike.name)
    expect(page).to have_content(@bike.full_suspension)
    expect(page).to have_content(@bike.created_at)
    expect(page).to have_content(@bike.updated_at)
    expect(page).to have_content(@bike.travel_length)

  end


end