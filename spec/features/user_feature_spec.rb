require 'rails_helper'
require 'helper_methods'

describe 'signing up' do
  it "a user can sign up" do
    sign_up("dave@dave.com", "12345678")
  end
end


