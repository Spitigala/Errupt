require 'rails_helper'

RSpec.describe ErrorLog, :type => :model do
  it "is valid with title and description" do 
  	expect(ErrorLog.new(title: "test error", description: "test description of error")).to be_valid
  end

  it "is valid with title, description, OS, OS version, language, language version,
     framework, framework version" do
     	expect(build(:errorlog)).to be_valid
  end
  
  it "is invalid without title" do
  	expect(ErrorLog.new(title: nil)).to have(1).errors_on(:title)
  end
  
  it "is invalid without description" do
  	expect(ErrorLog.new(description: nil)).to have(1).errors_on(:description)
  end
end
