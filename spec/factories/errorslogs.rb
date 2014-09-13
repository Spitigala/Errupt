# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :errorlog, class: 'ErrorLog' do #need to specify class due to 2 word class name
  	sequence(:title) {|n| "Error #{n}"}
  	description "Test error description"
  	os "OSX"
  	os_version "1.7.1"
  	language "Ruby"
  	language_version "1.9.1"
  	framework "Rails"
  	framework_version "4.1.4"
  	public? true
  end
end
