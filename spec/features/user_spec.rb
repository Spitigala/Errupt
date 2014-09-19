require 'spec_helper'

feature 'user management'do
	background do
		# setup details
	end

	scenario 'adds a new user' do
		user = create(:user)
		# sign_in user

		visit root_path
		# expect{
			click_link 'sign_up'
			fill_in 'Email', with: 'test@example.com'
			find('password').fill_in 'Password', with: 'testpassword'
		# }
	end
end