require 'rails_helper'

describe SolutionsController do


	describe "GET #new" do
		it "assigns a new Solution to @solution" do
			errorlog = create(:errorlog)
			get :new, errorlog_id: errorlog.id
			expect(assigns(:solution)).to be_a_new(Solution)
		end

		it "renders the :new template" do
			errorlog = create(:errorlog)
			get :new, errorlog_id: errorlog.id
			expect(response).to render_template :new
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			
			it "saves the new Solution in the database" do
				
			end
			
			it "redirects to errorlog#show page for related error"
		end

		context "with invalid attributes" do
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
		context "with valid attributes" do
			it "updates the Solution in the database"
			it "redirects to show"
		end

		context "with invalid attributes" do
			it "does not update the Solution in the database"
			it "re-renders the :edit template"
		end
	end

	describe "DELETE #destroy" do
		it "deletes the Solution from the database"
		it "redirects to errorlog#show page for related error"
	end
	
end