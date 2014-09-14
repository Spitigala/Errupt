require 'rails_helper'

describe SolutionsController do


	describe "GET #new" do
		it "assigns a new Solution to @solution"
		it "renders the :new template"
	end

	describe "POST #create" do
		conext "with valid attributes" do
			it "saves the new Solution in the database"
			it "redirects to errorlog#show page for related error"
		end

		conext "with invalid attributes" do
			it "does not save the new Solution in the database"
			it "re-renders the :new template"
		end
	end

	describe "GET #show" do
		it "assigns the requested Solution to @solution"
		it "renders the :show template"
	end

	describe "GET #edit" do
		it "assigns the requested Solution to @solution"
		it "renders the :edit template"
	end

	describe "PATCH #update" do
		conext "with valid attributes" do
			it "updates the Solution in the database"
			it "redirects to show"
		end

		conext "with invalid attributes" do
			it "does not update the Solution in the database"
			it "re-renders the :edit template"
		end
	end

	describe "DELETE #destroy" do
		it "deletes the Solution from the database"
		it "redirects to errorlog#show page for related error"
	end
	
end