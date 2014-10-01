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
      expect(page).to have_content("Endorsement: 1")
    end
  end
  it 'Changes Endorsement to Endorsements when plural', js: true do
    visit '/restaurants'
    click_link 'Endorse'
    click_link 'Endorse'
    within '.endorsements' do
      expect(page).to have_content("Endorsements: 2")
    end
  end
end
