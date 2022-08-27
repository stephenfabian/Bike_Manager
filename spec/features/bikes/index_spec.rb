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

  #User Story 8, Child Index Link

  describe 'As a visitor' do
    describe 'When I visit any page on the site' do
      it 'Then I see a link at the top of the page that takes me to the Child Index' do

        shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
        bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: shop.id)

        visit "/bikes"
        visit "/bikes/#{bike.id}"
        visit "/shops"
        visit "/shops/#{shop.id}"
        visit "/shops/#{shop.id}/bikes"

        click_on "Bike Index"
        expect(current_path).to eq("/bikes")

      end
    end
  end

  describe 'User Story 15' do

    it 'when I visit Bike index, I only see bikes that have full_suspension (full_suspension = true)' do

      shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
      shop2 = Shop.create!(name: "Evo", rentals: FALSE, rank: 8)

      bike = Bike.create!(name: "Sorta Cool Bike", full_suspension: FALSE, travel_length: 150, shop_id: shop.id)
      bike2 = Bike.create!(name: "Semi Cool Bike", full_suspension: FALSE, travel_length: 156, shop_id: shop2.id)
      bike3 = Bike.create!(name: "Really Cool Bike", full_suspension: TRUE, travel_length: 98, shop_id: shop2.id)

      visit "/bikes"
      expect(page).to have_content("Really Cool Bike")
      expect(page).to_not have_content("Sorta Cool Bike")
      expect(page).to_not have_content("Semi Cool Bike")

    end
  end
end