# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
  	tag_name "Ruby"

  	factory :invalid_tag do
  		tag_name nil
  	end
  end
end
