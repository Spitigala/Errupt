require 'rails_helper'

describe "user registration" do
  it "allows new users to register with an email address and password" do
    visit root_path
    click_link 'sign up'
    fill_in "Firstname",                 :with => "john"
    fill_in "Lastname",                 :with => "doe"
    fill_in "Username",                 :with => "johndoe"
    fill_in "Email",                 :with => "alindeman@example.com"
    fill_in "Password",              :with => "password"
    fill_in "Password confirmation", :with => "password"

    click_button "Sign up"

    page.should have_content("Welcome! You have signed up successfully.")
  end
end