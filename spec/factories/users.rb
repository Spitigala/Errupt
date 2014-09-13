# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	firstname "John"
  	lastname "Doe"
  	sequence(:username) {|n| "user#{n}"}
  	sequence(:email) {|n| "email#{n}@example.com"} 
  	password "password"
  end
end
