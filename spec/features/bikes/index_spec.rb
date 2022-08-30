require 'rails_helper'

RSpec.describe 'the bikes index page' do
  it 'shows the bikes index' do
    shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
    shop2 = Shop.create!(name: "Evo", rentals: FALSE, rank: 8)
    bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: shop.id)
    bike2 = Bike.create!(name: "FuelEx", full_suspension: TRUE, travel_length: 130, shop_id: shop2.id)

    visit "/bikes"

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

# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 1

  describe 'User Story 18, Child Update From Childs Index Page' do
    it 'on Bike index page, each bike has a link to edit bikes info, the link takes you to an edit page' do
        @shop = Shop.create!(name: "Europe Bike Shop", rentals: TRUE, rank: 8)

        @bike1 = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
        @bike2 = Bike.create!(name: "Pivot", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

        visit ("/bikes")
        expect(page).to have_content("Santa Cruz")
        expect(page).to have_button("Edit Santa Cruz")

        expect(page).to have_content("Pivot")
        expect(page).to have_button("Edit Pivot")

        click_button("Edit Santa Cruz")
        expect(current_path).to eq("/bikes/#{@bike1.id}/edit")

        fill_in 'Name', with: 'Wills Bike'
        fill_in 'Full suspension', with: TRUE
        fill_in 'Travel length', with: 170
        click_button 'Update Bike'

        expect(current_path).to eq("/bikes/#{@bike1.id}")
        expect(page).to have_content('Wills Bike')
        expect(page).to have_content(TRUE)
        expect(page).to have_content(170)

        visit("/bikes")

        click_button("Edit Pivot")
        expect(current_path).to eq("/bikes/#{@bike2.id}/edit")

        fill_in 'Name', with: 'Stephens Bike'
        fill_in 'Full suspension', with: TRUE
        fill_in 'Travel length', with: 150
        click_button 'Update Bike'

        expect(current_path).to eq("/bikes/#{@bike2.id}")
        expect(page).to have_content('Stephens Bike')
        expect(page).to have_content(TRUE)
        expect(page).to have_content(150)
        expect(current_path).to eq("/bikes/#{@bike2.id}")

        visit "/bikes"
    end
  end


# User Story 23, Child Delete From Childs Index Page 

# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to delete that child
# When I click the link
# I should be taken to the `child_table_name` index page where I no longer see that child


  describe 'User Story 23, Child Delete From Childs Index Page' do
    it 'visit Bikes index or a Shops Bikes index, next to every bike theres a link to delete that bike.  
    When I click link get redirected to bikes index, where deleted bike isnt shown' do
        @shop = Shop.create!(name: "Europe Bike Shop", rentals: TRUE, rank: 8)

        @bike1 = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
        @bike2 = Bike.create!(name: "Pivot", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
        @bike3 = Bike.create!(name: "GT", full_suspension: TRUE, travel_length: 130, shop_id: @shop.id)

        visit("/bikes")
        expect(page).to have_button("Delete #{@bike1.name}")
        expect(page).to have_button("Delete #{@bike2.name}")
        expect(page).to have_button("Delete #{@bike3.name}")

        click_button("Delete #{@bike1.name}")
        expect(current_path).to eq("/bikes")
        
        expect(page).to_not have_content("Santa Cruz")
        expect(page).to have_content("Pivot")
        expect(page).to have_content("GT")

        visit("/shops/#{@shop.id}/bikes")
        expect(page).to have_button("Delete #{@bike2.name}")
        expect(page).to have_button("Delete #{@bike3.name}")

        click_button("Delete #{@bike2.name}")
        expect(current_path).to eq("/bikes")
        expect(page).to have_content("GT")
        expect(page).to_not have_content("Pivot")
        expect(page).to_not have_content("Santa Cruz")
    end
  end
end

