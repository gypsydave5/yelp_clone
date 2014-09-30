require 'spec_helper'

RSpec.describe Review, :type => :model do

  let(:restaurant) {Restaurant.new(name: "Pizza Express")}

  it 'cannot accept a review with a rating greater than five' do
    review = Review.new(rating: 20, comments: "I'm evil! EVIL!", restaurant_id: restaurant.id)
    expect(review).to have(1).error_on(:rating)
  end

  it 'cannot accept a review with a rating less than zero' do
    review = Review.new(rating: -5, comments: "Mwahahahaaaa!", restaurant_id: restaurant.id)
    expect(review).to have(1).error_on(:rating)
  end
end
