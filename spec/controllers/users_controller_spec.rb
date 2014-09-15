require 'rails_helper'

describe UsersController do

	describe "GET #new" do
		it "assigns a new User to @user"
		it "renders the :new template"
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new User in the database"
			it "redirects to show"
		end

		context "with invalid attributes" do
			it "does not save the new User in the database"
			it "re-renders the :new template"
		end
	end

	describe "GET #show" do
		it "assigns the requested User to @user"
		it "renders the :show template"
	end

	describe "GET #edit" do
		it "assigns the requested User to @user"
		it "renders the :edit template"
	end

	describe "PATCH #update" do
		context "with valid attributes" do
			it "updates the User in the database"
			it "redirects to show"
		end

		context "with invalid attributes" do
			it "does not update the User in the database"
			it "re-renders the :edit template"
		end
	end
	
end