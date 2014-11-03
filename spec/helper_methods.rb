def sign_up(email, password)
  visit '/'
  click_link 'Sign up'
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: password
  click_button "Sign up"
end

def leave_review(restaurant, comments, rating)
  visit '/'
  click_link "Review #{restaurant}"
  fill_in "Comments", with: comments
  select rating, from: "Rating"
  click_button "Submit Review"
end

def sign_in(email, password)
  visit '/'
  click_link 'Sign in'
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button 'Log in'
end
