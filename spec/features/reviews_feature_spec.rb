require 'rails_helper'

describe 'reviewing things' do

  before do
    Restaurant.create(name: 'KFC')
  end

  let(:kfc) {Restaurant.find_by(name: "KFC")}

  it 'allows users to leave reviews using the form which appears alongside restaurants' do
    leave_review("KFC", "It's alright", 3)
    expect(current_path).to eq '/restaurants'
    expect(page.find('.review')).to have_content "It's alright"
    expect(page.find('.rating')).to have_content "3"
  end

  context 'changing reviews' do
    before do
      leave_review("KFC","Love KFC", 5)
    end
    it 'allows you to edit reviews' do
      visit '/restaurants'
      expect(page.find('.review')).to have_content "Love KFC"
      click_link 'Edit review'
      fill_in "Comments", with: "It's alright"
      select '3', from: 'Rating'
      click_button 'Submit Review'
      expect(page.find('.review')).to have_content "It's alright"
      expect(page.find('.rating')).to have_content "3"
    end
  end

  it 'displays an average rating for all reviews' do
    leave_review("KFC", "So so", "1")
    leave_review("KFC", "Great", "5")
    expect(page.find('.average_rating')).to have_content("Average rating: ★★★☆☆☆")
  end

  context "showing time since creation" do
    before do
      Review.create(comments: "Hi", rating: 3, restaurant_id: kfc.id, created_at: (Time.now - 120))
    end
    it 'displays the time that has passed since the review was posted' do
      visit '/restaurants'
      expect(page.find('.time_since')).to have_content("2 minutes")
    end
  end

  def leave_review(restaurant, comments, rating)
    visit '/restaurants'
    click_link "Review #{restaurant}"
    fill_in "Comments", with: comments
    select rating, from: "Rating"
    click_button "Submit Review"
  end

end
