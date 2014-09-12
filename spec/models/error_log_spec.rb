require 'rails_helper'

RSpec.describe ErrorLog, :type => :model do
  it "is valid with title and description" do 
  	expect(ErrorLog.new(title: "test error", description: "test description of error")).to be_valid
  end

  it "is valid with title, description, OS, OS version, language, language version,
     framework, framework version" do
     error = ErrorLog.new(
     		title: "test error titiel",
     		description: "test error description",
     		os: "Mac",
     		os_version: "1.7.8",
     		language: "Ruby",
     		language_version: "2.0",
     		framework: "rails",
     		framework_version: "4.1.4"
     	)

     expect(error).to be_valid

  end
  
  it "is invalid without title" do
  	expect(ErrorLog.new(title: nil)).to have(1).errors_on(:title)
  end
  
  it "is invalid without description" do
  	expect(ErrorLog.new(description: nil)).to have(1).errors_on(:description)
  end
end
