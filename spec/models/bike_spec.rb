require 'rails_helper'

RSpec.describe Bike, type: :model do
  it {should belong_to :shop}
end

