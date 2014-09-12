require 'rails_helper'

RSpec.describe Tag, :type => :model do

	it "is valid with a tag name" do
  	expect(Tag.new(tag_name: "newtag")).to be_valid
	end

  it "is invalid without a tag name" do
  	expect(Tag.new(tag_name: nil)).to have(1).errors_on(:tag_name)
  end

  it "returns an array of tags when by_tag method is called" do 
  	tag = Tag.create(tag_name: "Ruby")
  	expect(Tag.by_tag("Ruby").tag_name).to eq "Ruby"
  end

end
