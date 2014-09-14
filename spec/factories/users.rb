# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
  	firstname {Faker::Name.first_name}
  	lastname {Faker::Name.last_name}
  	username {Faker::Internet.user_name}
  	email {Faker::Internet.email}
  	password "password"

  	after(:build) do |user| 
  		user.errorlogs << FactoryGirl.build(:errorlog, user_id: user.id)
  	end
  end
end
