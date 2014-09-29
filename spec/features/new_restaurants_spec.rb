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

  it 'should be able to create a new restaurant' do
    visit 'restaurants/new'
    fill_in "Restaurant name", with: 'KFC'
    click_button 'Create Restaurant'
    expect(page).to have_content 'KFC'
    expect(current_path).to eq '/restaurants'
  end

  it 'can create a new restaurant with a description' do
    visit 'restaurants/new'
    fill_in "Restaurant name", with: 'KFC'
    fill_in "Description", with: 'Chicken cottage wannabe. Got for the tower zinger burger'
    click_button 'Create Restaurant'
    expect(page).to have_content 'KFC'
    expect(current_path).to eq '/restaurants'
  end
end
