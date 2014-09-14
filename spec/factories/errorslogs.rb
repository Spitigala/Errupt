# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :errorlog do #need to specify class due to 2 word class name
  	sequence(:title) {|n| "Error #{n}"}
  	description {Faker::Lorem.paragraph}
  	os "OSX"
  	os_version {"1.7.1"}
  	language "Ruby"
  	language_version "1.9.1"
  	framework "Rails"
  	framework_version "4.1.4"
  	public? true

    after(:build) do |errorlog|
      errorlog.solutions << FactoryGirl.build(:solution, errorlog_id: errorlog.id)
    end
  end
end
