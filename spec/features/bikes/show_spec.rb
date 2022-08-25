require 'rails_helper'

RSpec.describe 'the bikes show page' do #USER STORY 2
#As a visitor
#When I visit '/parents/:id'
#Then I see the parent with that id including the parent's attributes:
#- data from each column that is on the parent table
  it 'displays the bike title and bike attributes' do

    bike = Bike.create!(name: "Bronson", full_suspension: TRUE, travel_length: 8)
    visit "/bikes/#{bike.id}"
    
    expect(page).to have_content(bike.id)
    expect(page).to have_content(bike.name)
    expect(page).to have_content(bike.full_suspension)
    expect(page).to have_content(bike.created_at)
    expect(page).to have_content(bike.updated_at)
    expect(page).to have_content(bike.travel_length)

  end


end