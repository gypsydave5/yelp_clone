require 'rails_helper'

describe 'endorsing reviews' do
  before do
    kfc = Restaurant.create(name: "KFC")
    kfc.reviews.create(rating: 3, comments: "Abominable")
  end

  it 'a user can endorse a review, which increments the endorsement count', js: true do
    visit '/restaurants'
    click_link 'Endorse'
    within '.endorsements' do
      expect(page).to have_content("1 endorsement")
    end
  end
  it 'Changes Endorsement to Endorsements when plural', js: true do
    visit '/restaurants'
    click_link 'Endorse'
    click_link 'Endorse'
    within '.endorsements' do
      expect(page).to have_content("2 endorsements")
    end
  end
end
