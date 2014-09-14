require 'rails_helper'

describe ErrorlogsController do

	describe "GET #index" do
		it "populates an array of all of current user's errorlogs"
		it "renders the :index template"
	end

	describe "GET #new" do
		it "assigns a new Errorlog to @errorlog"
		it "renders the :new template"
	end

	describe "POST #create" do
		conext "with valid attributes" do
			it "saves the new Errorlog in the database"
			it "redirects to show"
		end

		conext "with invalid attributes" do
			it "does not save the new Errorlog in the database"
			it "re-renders the :new template"
		end
	end

	describe "GET #show" do
		it "assigns the requested Errorlog to @errorlog"
		it "renders the :show template"
	end

	describe "GET #edit" do
		it "assigns the requested Errorlog to @errorlog"
		it "renders the :edit template"
	end

	describe "PATCH #update" do
		conext "with valid attributes" do
			it "updates the Errorlog in the database"
			it "redirects to show"
		end

		conext "with invalid attributes" do
			it "does not update the Errorlog in the database"
			it "re-renders the :edit template"
		end
	end

	describe "DELETE #destroy" do
		it "deletes the Errorlog from the database"
		it "redirects to errorlogs#index"
	end
	
end