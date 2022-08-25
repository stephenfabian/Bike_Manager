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
        end

        it 'And next to each of the records I see when it was created' do 
        #does this need to be more specific? Test that created_at is NEXT to shop.name

          visit '/shops'
          save_and_open_page
     
          expect(page).to have_content(@shop.name)
          expect(page).to have_content(@shop.created_at)
           
        end
    end
  end
end
