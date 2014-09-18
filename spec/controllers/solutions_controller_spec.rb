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
				errorlog = create(:errorlog)
				expect{
					post :create, errorlog_id: errorlog.id, solution: attributes_for(:solution)
				}.to change(Solution, :count).by(1)
			end
			
			it "redirects to errorlog#show page for related error" do
				errorlog = create(:errorlog)
				post :create, errorlog_id: errorlog.id, solution: attributes_for(:solution)
				expect(response).to redirect_to  errorlog_path(errorlog)
			end
		end

		context "with invalid attributes" do
			it "does not save the new Solution in the database" do
				errorlog = create(:errorlog)
				expect{
					post :create, errorlog_id: errorlog.id, solution: attributes_for(:invalid_solution)
				}.to_not change(Solution, :count)
			end
			it "re-renders the :new template" do
				errorlog = create(:errorlog)
				post :create, errorlog_id: errorlog.id, solution: attributes_for(:invalid_solution)
				expect(response).to render_template :new
			end
		end
	end

	describe "GET #show" do
		it "assigns the requested Solution to @solution" do
			errorlog = create(:errorlog)
			solution = create(:solution, errorlog_id: errorlog.id)
			get :show, errorlog_id: errorlog.id, id: solution
			expect(assigns(:solution)).to eq solution
		end
		it "renders the :show template" do
			errorlog = create(:errorlog)
			solution = create(:solution, errorlog_id: errorlog.id)
			get :show, errorlog_id: errorlog.id, id: solution
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested Solution to @solution" do
			errorlog = create(:errorlog)
			solution = create(:solution, errorlog_id: errorlog.id)
			get :edit, errorlog_id: errorlog.id, id: solution
			expect(assigns(:solution)).to eq solution
		end
		it "renders the :edit template" do
			errorlog = create(:errorlog)
			solution = create(:solution, errorlog_id: errorlog.id)
			get :edit, errorlog_id: errorlog.id, id: solution
			expect(response).to render_template :edit
		end
	end

	describe "PATCH #update" do

		before :each do
			@errorlog = create(:errorlog)
			@solution = create(:solution, description: "Test desc for update", errorlog_id: @errorlog.id)
		end

		context "with valid attributes" do
			it "locates the requested solution" do
				patch :update, errorlog_id: @errorlog.id, id: @solution
				expect(assigns(:solution)).to eq @solution
			end
			
			it "updates the Solution in the database" do
				
			end
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