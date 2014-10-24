module SignupMacros
	def sign_up_user(user)
		visit root_path
		click_link 'Sign Up', match: :first
		fill_in "Firstname",             :with => user.firstname
		fill_in "Lastname",              :with => user.lastname
		fill_in "Username",              :with => user.username
		fill_in "Email",                 :with => user.email
		fill_in "Password",              :with => "password"
		fill_in "Password confirmation", :with => "password"

		click_button "Sign up"
	end

	def sign_in_user(user)
		visit root_path
		click_link 'Log In'
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Log In"
	end
end