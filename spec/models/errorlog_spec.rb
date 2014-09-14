require 'rails_helper'

RSpec.describe Errorlog, :type => :model do
  it "is valid with title and description" do 
  	expect(Errorlog.new(title: "test error", description: "test description of error")).to be_valid
  end

  it "is valid with title, description, OS, OS version, language, language version,
     framework, framework version" do
     	expect(build(:errorlog)).to be_valid
  end
  
  it "is invalid without title" do
  	expect(Errorlog.new(title: nil)).to have(1).errors_on(:title)
  end
  
  it "is invalid without description" do
  	expect(Errorlog.new(description: nil)).to have(1).errors_on(:description)
  end

  it "has a solution" do
    expect(create(:errorlog).solutions.count).to eq 1
  end
end
