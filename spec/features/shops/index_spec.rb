require 'rails_helper'

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created


RSpec.describe 'the Shop Index sorted by Most Recently Created' do #USER STORY 6

  describe 'As a visitor' do
    before :each do
       @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
       @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
    end

    describe 'When I visit the parent index' do

        let(:this) { "Denver Bike Shop" }
        let(:that) { "OldShop" }

      it 'I see that records are ordered by most recently created first' do
        #OldShop and NewerShop are existing records in shops test db

          visit '/shops'
          save_and_open_page

          expect(this).to appear_before(that)
          expect(@shop.name).to appear_before("OldShop")
        end

        it 'And next to each of the records I see when it was created' do 

        #within blocks??? Chris's idea to come back to later

          visit '/shops'
          save_and_open_page
     
          expect(page).to have_content(@shop.name)
          expect(page).to have_content(@shop.created_at)
           
        end
    end
  end


# User Story 9, Parent Index Link

  describe 'As a visitor' do
    describe 'When I visit any page on the site' do 
      it 'Then I see a link at the top of the page that takes me to the Parent Index' do
        @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
        @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

        visit "/bikes"
        visit "/bikes/#{@bike.id}"
        visit "/shops"
        visit "/shops/#{@shop.id}"
        visit "/shops/#{@shop.id}/bikes"

        click_on "Shop Index"
        expect(current_path).to eq("/shops")

      end
    end
  end

  # User Story 11, Parent Creation 

  describe 'As a visitor' do 
    describe 'When I visit the Parent Index page' do
      it 'Then I see a link to create a new Parent record, New Parent' do
        @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
        @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
        visit '/shops'
        expect(page).to have_content("New Shop")
        save_and_open_page

      end
    end
  end

describe 'When I click this link' do 
  it 'Then I am taken to /parents/new where I  see a form for a new parent record' do
     @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
     @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)

     visit '/shops'
     click_link("New Shop")
     expect(current_path).to eq("/shops/new")
  end
end

  it 'can create a new shop' do 
      @shop = Shop.create!(name: "Denver Bike Shop", rentals: TRUE, rank: 8)
      @bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 150, shop_id: @shop.id)
     visit '/shops/new'

     fill_in('Name', with: 'OregonBikeShop')
     click_button('Create Shop')

     expect(current_path).to eq("/shops")
     expect(page).to have_content('OregonBikeShop')

  end


  describe 'User Story 17' do #How do I get the edit  button next to the Shop name? Do I need to?
    it 'Shop index page has links next to each shop which take you to the shops edit page, 
    after editing should return to shop index page' do
      @shop = Shop.create!(name: "Europe Bike Shop", rentals: TRUE, rank: 8)
      @shop2 = Shop.create!(name: "Sweden Bike Shop", rentals: TRUE, rank: 5)

      visit ("/shops")
      expect(page).to have_content("Europe Bike Shop")
      expect(page).to have_button("Edit Europe Bike Shop")

      expect(page).to have_content("Sweden Bike Shop")
      expect(page).to have_button("Edit Sweden Bike Shop")

      click_button("Edit Europe Bike Shop")
      expect(current_path).to eq("/shops/#{@shop.id}/edit")

      fill_in 'Name', with: 'Ok Shop'
      fill_in 'Rank', with: 45
      fill_in 'rentals', with: TRUE
      click_button 'Submit Changes'

      expect(current_path).to eq("/shops/#{@shop.id}")
      expect(page).to have_content('Ok Shop')
      expect(page).to have_content(45)
      expect(page).to have_content(TRUE)

      visit("/shops")

      click_button("Edit Sweden Bike Shop")
      expect(current_path).to eq("/shops/#{@shop2.id}/edit")

      fill_in 'Name', with: 'Coolest Shop'
      fill_in 'Rank', with: 99
      fill_in 'rentals', with: TRUE
      click_button 'Submit Changes'

      expect(current_path).to eq("/shops/#{@shop2.id}")
      expect(page).to have_content('Coolest Shop')
      expect(page).to have_content(99)
      expect(page).to have_content(TRUE)
      expect(current_path).to eq("/shops/#{@shop2.id}")

      visit "/shops"
    end
  end
end
