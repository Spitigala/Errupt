require 'rails_helper'

feature "user registration" do
  scenario "registers a new user", js: true do
  	user = build(:user)
  	sign_up_user user
    page.should have_content("Welcome! You have signed up successfully.")
  end

  scenario "logs in an existing user" do
  	user = create(:user)
  	sign_in_user user
  end
end