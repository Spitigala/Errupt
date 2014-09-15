# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :errorlog do #need to specify class if using 2 word class name
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
      2.times do
      errorlog.solutions << FactoryGirl.build(:solution, errorlog: errorlog)
      end
      # error_tags for join table testing
      tag1 = FactoryGirl.build(:tag)
      tag2 = FactoryGirl.build(:tag)
      errorlog.error_tags << FactoryGirl.build(:error_tag, errorlog: errorlog, tag: tag1)
      errorlog.error_tags << FactoryGirl.build(:error_tag, errorlog: errorlog, tag: tag2)
    end

    factory :invalid_errorlog do
      title nil
    end
  end
end
