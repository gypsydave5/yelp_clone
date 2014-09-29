require 'rails_helper'

describe 'adding a new restaurant' do
  context 'on page load' do
    it 'should have a title' do
      visit 'restaurants/new'
      expect(page).to have_content "Add new restaurant"
    end

    it 'should have a form to input both restaurant name and cuisine' do
      visit 'restaurants/new'
      expect(page).to have_field 'Restaurant name'
      expect(page).to have_field 'Type of cuisine'
    end
  end
end
