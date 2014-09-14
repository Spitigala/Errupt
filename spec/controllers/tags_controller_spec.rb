require 'rails_helper'

describe TagsController do

	describe "GET #index" do
		it "populates an array of all tags"
		it "renders the :index template"
	end

	describe "GET #new" do
		it "assigns a new Tag to @tag"
		it "renders the :new template"
	end

	describe "POST #create" do
		conext "with valid attributes" do
			it "saves the new Tag in the database"
			it "redirects to show"
		end

		conext "with invalid attributes" do
			it "does not save the new Tag in the database"
			it "re-renders the :new template"
		end
	end

	describe "GET #show" do
		it "assigns the requested Tag to @tag"
		it "renders the :show template"
	end

	describe "GET #edit" do
		it "assigns the requested Tag to @tag"
		it "renders the :edit template"
	end

	describe "PATCH #update" do
		conext "with valid attributes" do
			it "updates the Tag in the database"
			it "redirects to show"
		end

		conext "with invalid attributes" do
			it "does not update the Tag in the database"
			it "re-renders the :edit template"
		end
	end

	describe "DELETE #destroy" do
		it "deletes the Tag from the database"
		it "redirects to tags#index page"
	end
	
end