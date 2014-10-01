require 'spec_helper'

RSpec.describe Restaurant, :type => :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it is a unique name' do
    Restaurant.create(name: "The Ivy")
    restaurant = Restaurant.new(name: "The Ivy")
    expect(restaurant).to have(1).error_on(:name)
  end

  describe '#average_rating' do

      let(:restaurant) { Restaurant.create(name: "Pizza Express") }

    context 'no reviews' do
      it "Returns 'N/A' when there are no reviews" do
        expect(restaurant.average_rating).to eq "N/A"
      end
    end

    context 'one review' do
      it 'Returns the one rating' do
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq ("4")
      end
    end
  end

end
