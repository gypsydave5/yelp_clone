require 'spec_helper'

RSpec.describe Review, :type => :model do

  let(:restaurant) {Restaurant.new(name: "Pizza Express")}

  it 'cannot accept a review with a rating greater than six' do
    review = Review.new(rating: 7, comments: "I'm evil! EVIL!", restaurant_id: restaurant.id)
    expect(review).to have(1).error_on(:rating)
  end

  it 'cannot accept a review with a rating less than one' do
    review = Review.new(rating: 0, comments: "Mwahahahaaaa!", restaurant_id: restaurant.id)
    expect(review).to have(1).error_on(:rating)
  end

  it 'Will accept valid ratings' do
    review = Review.new(rating: 3, comments: "S'alright", restaurant_id: restaurant.id)
    expect(review).to be_valid
  end
end
