require 'rails_helper'

feature "user registration" do
  scenario "registers a new user " do
  	user = build(:user)
  	sign_up_user user
    page.should have_content("Your Error Logs")
    expect(current_path).to eq(dashboard_path)
  end
end

feature "user login" do
	scenario "logs in an existing user" do
		user = create(:user)
		sign_in_user user
		page.should have_content("Your Error Logs")
    expect(current_path).to eq(dashboard_path)
	end
end

