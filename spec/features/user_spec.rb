require 'rails_helper'

feature "user registration" do
  scenario "registers a new user" do
  	sign_up
    page.should have_content("Welcome! You have signed up successfully.")
  end
end