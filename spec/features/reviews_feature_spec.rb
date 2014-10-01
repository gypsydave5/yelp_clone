require 'rails_helper'

describe 'reviewing things' do

  before do
    Restaurant.create(name: 'KFC')
  end

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
    leave_review("KFC", "So so", "3")
    leave_review("KFC", "Great", "5")
    expect(page).to have_content("Average rating: 4")
  end

  def leave_review(restaurant, comments, rating)
    visit '/restaurants'
    click_link "Review #{restaurant}"
    fill_in "Comments", with: comments
    select rating, from: "Rating"
    click_button "Submit Review"
  end

end
