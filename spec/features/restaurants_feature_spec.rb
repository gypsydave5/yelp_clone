require 'rails_helper'

describe 'restaurants' do
  before :each do
    visit '/restaurants'
  end

  context 'no restaurants have been added' do
    it 'should display a prompt to add a restaurant' do
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end

    it "should display them" do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context "adding new restaurants" do

    it "should have a page to add a new restuarant" do
      click_on 'Add a restaurant'
      expect(current_path).to eq '/restaurants/new'
    end

  end
end

describe 'editing restaurants' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it "allows a user to edit a restaurant" do
    visit '/restaurants'
    click_link 'Edit KFC'
    fill_in 'Restaurant name', with: 'Kentucky Fried Chicken'
    click_button 'Update Restaurant'
    expect(page).to have_content 'Kentucky Fried Chicken'
    expect(current_path).to eq '/restaurants'
  end
end

describe 'deleting a restaurant' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'removes a restaurant when a user clicks a delete link' do
    visit '/restaurants'
    click_link 'Delete KFC'
    expect(page).not_to have_content 'KFC'
    expect(page).to have_content 'Restaurant deleted successfully'
  end
end

describe 'getting a restaurants details' do
  before do
    Restaurant.create(name: 'KFC', description: "Finger lickin' goodness from an old man with a box full of greasy bones.")
  end

  it 'can display a detailed view of the restaurant' do
    visit '/restaurants'
    within('h2') do
      click_link 'KFC'
    end
    expect(page).to have_content("Finger lickin' goodness from an old man with a box full of greasy bones.")
  end
end

