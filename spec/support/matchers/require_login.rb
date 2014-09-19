# require 'rspec/expectations'
# RSpec::Matchers.define :require_login do |expected|
# 	match do |actual|
# 		expect(actual).to \
# 			redirect_to Rails.application.routes.url_helpers.new_user_session_path
# 	end
# end