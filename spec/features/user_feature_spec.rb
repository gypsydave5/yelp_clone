require 'rails_helper'
require 'helper_methods'

describe 'signing up' do
  it "a user can sign up" do
    sign_up "dave@dave.com", "12345678"
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it "a user can sign out" do
    sign_up "dave@dave.com", "12345678"
    click_link "Sign out"
    expect(page).to have_content('Signed out successfully')
  end

  it "a user can sign out" do
    sign_up "dave@dave.com", "12345678"
    click_link "Sign out"
    sign_in "dave@dave.com", "12345678"
    expect(page).to have_content('Signed in  successfully')
  end

end


