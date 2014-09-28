require 'rails_helper'

RSpec.describe Tag, :type => :model do

  it { should have_many(:error_tags) }
  it { should have_many(:errorlogs).through(:error_tags) }
  it { should validate_presence_of(:tag_name) }

	it "is valid with a tag name" do
  	expect(Tag.new(tag_name: "newtag")).to be_valid
	end

  it "is invalid without a tag name" do
  	expect(Tag.new(tag_name: nil)).to have(1).errors_on(:tag_name)
  end

end
