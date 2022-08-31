require 'rails_helper'

RSpec.describe Bike, type: :model do
  describe 'relationship' do
  it {should belong_to :shop}
    end
  it { should validate_presence_of (:name)}
  it { should validate_presence_of (:travel_length)}
  # it { should validate_presence_of (:full_suspension)}
end

