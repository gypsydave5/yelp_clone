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

  context 'valid restaurant' do
    it 'should be able to create a new restaurant' do
      visit 'restaurants/new'
      fill_in "Restaurant name", with: 'KFC'
      fill_in "Description", with: 'Chicken cottage wannabe. Go for the tower zinger burger'
      fill_in "Cuisine", with: 'Chicken'
      click_button 'Create Restaurant'
      expect(page.find('h2')).to have_content 'KFC'
      expect(page.find('.cuisine')).to have_content 'Chicken'
      expect(current_path).to eq '/restaurants'
      within 'h2' do
        click_link 'KFC'
      end
      expect(page).to have_content 'Chicken cottage wannabe. Go for the tower zinger burger'
    end
  end

  context 'an invalid restaurant' do
    it 'does not let you submit a name that is too short' do
      visit '/restaurants/new'
      fill_in 'Restaurant name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end
end
