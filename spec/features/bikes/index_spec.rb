require 'rails_helper'

RSpec.describe 'the bikes index page' do
  it 'shows the bikes index' do
    shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
    shop2 = Shop.create!(name: "Evo", rentals: FALSE, rank: 8)
    # require 'pry'; binding.pry
    bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: shop.id)
    bike2 = Bike.create!(name: "FuelEx", full_suspension: TRUE, travel_length: 130, shop_id: shop2.id)

    visit "/bikes"
    save_and_open_page

    expect(page).to have_content(bike.name)
    expect(page).to have_content(bike2.name)
  end

end