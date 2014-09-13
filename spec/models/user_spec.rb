require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with a firstname, lastname, username, email and password" do
  	expect(FactoryGirl.build(:user)).to be_valid
  end
  
  it "is invalid without a firstname" do 
  	expect(User.new(firstname: nil)).to have(1).errors_on(:firstname)
  end
  
  it "is invalid without a lastname" do 
  	expect(User.new(lastname: nil)).to have(1).errors_on(:lastname)
  end

  it "is invalid without a username" do 
  	expect(User.new(username: nil)).to have(1).errors_on(:username)
  end

  it "is invalid without a email" do
  	expect(User.new(email: nil)).to have(2).errors_on(:email)
  end
  
  it "is invalid without a password" do 
  	expect(User.new(password: nil)).to have(1).errors_on(:password)
  end
  
  it "is invalid with a duplicate email" do
    user1 = FactoryGirl.create(:user)
    user2  = FactoryGirl.build(:user, email: "email2@example.com")
  	expect(user2).to have(2).errors_on(:email)
  end
  
  # it "is invalid with a duplicate username" do 
  # 	User.create(
  # 			firstname: "Joe", lastname: "Tester",
  # 			username: "testusertwo", email: "tester3@example.com",
  # 			password: "testpw"
  # 		)

  # 	user = User.new(
  # 		firstname: "Mike", lastname: "Tester",
  # 		username: "testusertwo", email: "tester4@example.com",
  # 		password: "testpw"
  # 		)

  # 	expect(user).to have(1).errors_on(:username)
  # end
end
