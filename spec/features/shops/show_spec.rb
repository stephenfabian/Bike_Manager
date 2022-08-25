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


# User Story 7, Parent Child Count

  describe 'As a visitor' do
    describe 'When I visit a parents show page' do
      it 'I see a count of the number of children associated with this parent' do

        @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
        @bike1 = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
        @bike2 = Bike.create!(name: "Pivot", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

        visit "/shops/#{@shop.id}"
        save_and_open_page

        expect(page).to have_content(@shop.bikes.count)
        expect(@shop.bikes.count).to eq(2)
      end
    end 
  end
end