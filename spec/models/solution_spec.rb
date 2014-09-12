require 'rails_helper'

RSpec.describe Solution, :type => :model do
  
	it "is valid with a description and worked?" do
		expect(Solution.new(description: "test description 1234 $%&*^645", worked?: true)).to be_valid
	end
	
	it "is invalid without a description" do
		expect(Solution.new(description: nil)).to have(1).errors_on(:description)
	end
	
	it "is invalid without worked indicator" do
		expect(Solution.new(worked?: nil)).to have(1).errors_on(:worked?)
	end
end
