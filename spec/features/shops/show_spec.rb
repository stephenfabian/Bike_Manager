require 'rails_helper'

RSpec.describe 'the shops show page' do 
  describe 'User Story 2' do
    describe 'When I visit /parents/:id'do
      it 'I see the parent with that id including the parents attributes' do
  
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
  end

  describe 'User Story 7, Parent Child Count' do
    describe 'As a visitor' do
      describe 'When I visit a parents show page' do
        it 'I see a count of the number of children associated with this parent' do

          @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
          @bike1 = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
          @bike2 = Bike.create!(name: "Pivot", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

          visit "/shops/#{@shop.id}"

          expect(page).to have_content(@shop.bikes.count)
          expect(@shop.bikes.count).to eq(2)
        end
      end 
    end
  end

  describe 'User Story 10, Parent Child Index Link' do
    describe 'When I visit a parent show page (/parents/:id)' do
      it 'Then I see a link to take me to that parents `child_table_name` page (/parents/:id/child_table_name)' do
        @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)

        visit "/shops/#{@shop.id}"

        click_on("Bikes At This Shop")
        expect(current_path).to eq("/shops/#{@shop.id}/bikes")
      end
    end
  end

  describe 'User Story 19 - Parent Delete' do
    it 'can delete Shop from Shop#show page, shop and its bike records are deleted, redirect to shop index, shop shows as deleted' do
      @shop = Shop.create!(name: "Europe Bike Shop", rentals: TRUE, rank: 8)

      @bike1 = Bike.create!(name: "Santa Cruz", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
      @bike2 = Bike.create!(name: "Pivot", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

      visit "/shops/#{@shop.id}"
      click_button("Delete")

      expect(current_path).to eq("/shops")
      expect(page).to_not have_content("Europe Bike Shop")
    end
  end
end