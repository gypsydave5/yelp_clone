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
      Restaurant.create(name: 'KFC', cuisine: 'Chicken')
    end

    it "should display them" do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end

    it 'should show the cuisine' do
      visit '/restaurants'
      expect(page).to have_content('Chicken')
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
    Restaurant.create(name: 'KFC', description: "Food", cuisine: "Food")
  end

  it "allows a user to edit a restaurant" do
    visit '/restaurants'
    click_link 'Edit KFC'
    fill_in 'Restaurant name', with: 'Kentucky Fried Chicken'
    fill_in 'Description', with: 'Chicken flavour food'
    fill_in 'Cuisine', with: 'Dirty'
    click_button 'Update Restaurant'
    expect(page.find('h2')).to have_content 'Kentucky Fried Chicken'
    expect(page.find('.cuisine')).to have_content 'Dirty'
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
    Restaurant.create(name: 'Kentucky Fried Chicken', description: "Finger lickin' goodness from an old man with a box full of greasy bones.", cuisine: "Chicken")
  end

  it 'can display a detailed view of the restaurant' do
    visit '/restaurants'
    within('h2') do
      click_link 'Kentucky Fried Chicken'
    end
    expect(page).to have_content("Finger lickin' goodness from an old man with a box full of greasy bones.")
    expect(current_path).to eq "/restaurants/#{Restaurant.find_by(name: 'Kentucky Fried Chicken').id}"
  end

  it 'can display a detailed view of the restaurant' do
    visit "/restaurants/#{Restaurant.find_by(name: 'Kentucky Fried Chicken').id}"
    expect(page.find('.cuisine')).to have_content "Chicken"
  end

  it 'can navigate back to the restaurants list' do
    visit '/restaurants'
    within('h2') do
      click_link 'Kentucky Fried Chicken'
    end
    click_link 'Return to restaurants list'
    expect(current_path).to eq '/restaurants'
  end
end



