require 'rails_helper'

describe Tag do

  it { should have_many(:error_tags) }
  it { should have_many(:errorlogs).through(:error_tags) }
  it { should validate_presence_of(:tag_name) }

	it "is valid with a tag name" do
  	expect(Tag.new(tag_name: "newtag")).to be_valid
	end

  it "is invalid without a tag name" do
  	expect(Tag.new(tag_name: nil)).to have(1).errors_on(:tag_name)
  end


  describe "search by tag name" do
    before :each do
      @tag = Tag.create(tag_name: "Ruby")
    end

    context "tag name search with a match" do
      it "returns an array of tags when by_tag method is called" do 
        expect(Tag.by_tag("Ruby")).to eq [@tag]
      end
    end

    context "tag name search without a match" do 
      it "returns no results if a matching tag is not found" do 
        expect(Tag.by_tag("Javascript")).to_not include @tag
      end
    end
  end

end
