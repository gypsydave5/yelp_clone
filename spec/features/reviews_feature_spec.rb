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
end
