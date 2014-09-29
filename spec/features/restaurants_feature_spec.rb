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

