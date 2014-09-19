module SignupMacros
	def sign_up_user
		visit root_path
		click_link 'sign up'
		fill_in "Firstname",             :with => "john"
		fill_in "Lastname",              :with => "doe"
		fill_in "Username",              :with => "johndoe"
		fill_in "Email",                 :with => "jd@example.com"
		fill_in "Password",              :with => "password"
		fill_in "Password confirmation", :with => "password"

		click_button "Sign up"
	end

	def sign_in_user(user)
		visit root_path
		click_link 'log in'
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Log in"
	end
end