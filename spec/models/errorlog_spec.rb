require 'rails_helper'


RSpec.describe Errorlog, :type => :model do

  let(:errorlog) { FactoryGirl.create(:errorlog) }

  it { should belong_to(:user) }
  it { should have_many(:solutions) }
  it { should have_many(:error_tags) }
  it { should have_many(:tags).through(:error_tags) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_inclusion_of(:public).in_array([true,false]) }

  it "is valid with title and description" do 
  	expect(Errorlog.new(title: "test error", description: "test description of error")).to be_valid
  end

  it "is valid with title, description, OS, OS version, language, language version,
     framework, framework version" do
     expect(build(:errorlog)).to be_valid
  end

  it "is valid with public: false" do
     expect(build(:errorlog, public: false)).to be_valid
  end
  
  it "is invalid without title" do
  	expect(Errorlog.new(title: nil)).to have(1).errors_on(:title)
  end
  
  it "is invalid without description" do
  	expect(Errorlog.new(description: nil)).to have(1).errors_on(:description)
  end

  describe "tagged_with method" do
    it "returns a list of errorlogs with a given tag" do
      errorlog.tags << create(:tag, tag_name: "taggedwithtest")
      expect(Errorlog.tagged_with("taggedwithtest")).to match_array([errorlog])
    end
  end

  describe "tag_list method" do
    it "return a list of errorlog's tags in a string" do
      expect(errorlog.tag_list).to eq ("Ruby, Ruby")
    end
  end

  describe "tag_list=(names) method" do
    it "creates tags from a string" do
      new_errorlog = create(:errorlog, tag_list: "testtag1, testtag2")
      expect(new_errorlog.tags.first.tag_name).to eq "testtag1"
      expect(new_errorlog.tags.last.tag_name).to eq "testtag2"
    end
  end

  describe "Errorlog association tests" do
    it "has many solutions" do
      expect(create(:errorlog).solutions.count).to eq 2
    end

    it "has many error tags" do
      expect(create(:errorlog).error_tags.count).to eq 2
    end
  end
end
