require 'rails_helper'

describe 'adding a new restaurant' do
  context 'on page load' do
    it 'should have a title' do
      visit 'restaurants/new'
      expect(page).to have_content "Add new restaurant"
    end

    it 'should have a form to input both restaurant name' do
      visit 'restaurants/new'
      expect(page).to have_field 'Restaurant name'
    end
  end

  it 'should be able to create a new restaurantt' do
    visit 'restaurants/new'
    fill_in "Restaurant name", with: 'KFC'
    click_button 'Create Restaurant'
    expect(page).to have_content 'KFC'
    expect(current_path).to eq '/restaurants'
  end
end
