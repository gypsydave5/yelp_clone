require 'rails_helper'

describe 'reviewing things' do

  before do
    Restaurant.create(name: 'KFC')
  end

  it 'allows users to leave reviews using the form which appears alongside restaurants' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Comments", with: "It's alright"
    select '3', from: 'Rating'
    click_button 'Submit Review'
    expect(current_path).to eq '/restaurants'
    expect(page.find('.review')).to have_content "It's alright"
    expect(page.find('.rating')).to have_content "3"
  end

  context 'changing reviews' do
    before do
      kfc = Restaurant.find_by(name: 'KFC')
      Review.create(comments:"Love KFC", rating: 5, restaurant_id: kfc.id )
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
end
