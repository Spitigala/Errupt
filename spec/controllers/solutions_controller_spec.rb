require 'rails_helper'

describe SolutionsController do

	let!(:errorlog) do
		create(:errorlog)
	end

	let!(:solution) do
		create(:solution, errorlog_id: errorlog.id)
	end

	describe "GET #new" do
		it "assigns a new Solution to solution" do
			get :new, errorlog_id: errorlog.id
			expect(assigns(:solution)).to be_a_new(Solution)
		end

		it "renders the :new template" do
			get :new, errorlog_id: errorlog.id
			expect(response).to render_template :new
		end
	end

	describe "POST #create" do

		context "with valid attributes" do
			it "saves the new Solution in the database" do
				expect{
					post :create, errorlog_id: errorlog.id, solution: attributes_for(:solution)
				}.to change(Solution, :count).by(1)
			end
			
			it "redirects to errorlog#show page for related error" do
				post :create, errorlog_id: errorlog.id, solution: attributes_for(:solution)
				expect(response).to redirect_to  errorlog_path(errorlog)
			end
		end

		context "with invalid attributes" do
			it "does not save the new Solution in the database" do
				expect{
					post :create, errorlog_id: errorlog.id, solution: attributes_for(:invalid_solution)
				}.to_not change(Solution, :count)
			end
			it "re-renders the :new template" do
				post :create, errorlog_id: errorlog.id, solution: attributes_for(:invalid_solution)
				expect(response).to render_template :new
			end
		end
	end

	describe "GET #show" do
		it "assigns the requested Solution to solution" do
			get :show, errorlog_id: errorlog.id, id: solution
			expect(assigns(:solution)).to eq solution
		end
		it "renders the :show template" do
			get :show, errorlog_id: errorlog.id, id: solution
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested Solution to solution" do
			get :edit, errorlog_id: errorlog.id, id: solution
			expect(assigns(:solution)).to eq solution
		end
		it "renders the :edit template" do
			get :edit, errorlog_id: errorlog.id, id: solution
			expect(response).to render_template :edit
		end
	end

	describe "PATCH #update" do
		context "with valid attributes" do
			it "locates the requested solution" do
				patch :update, errorlog_id: errorlog, id: solution, solution: attributes_for(:solution)
				expect(assigns(:solution)).to eq(solution)
			end
			
			it "updates the Solution's attributes in the database" do
				patch :update, errorlog_id: errorlog, id: solution, solution: attributes_for(:solution, description: "updated solution desc")
				solution.reload
				expect(solution.description).to eq("updated solution desc")
			end

			it "redirects to show" do
				patch :update, id: solution, errorlog_id: errorlog, solution: attributes_for(:solution)
				expect(response).to redirect_to errorlog_solution_path
			end
		end

		context "with invalid attributes" do
			it "does not update the Solution in the database" do
				patch :update, errorlog_id: errorlog, id: solution, solution: attributes_for(:solution, description: nil)
				expect(solution.description).to_not eq(nil)
			end
			it "re-renders the :edit template" do
				patch :update, errorlog_id: errorlog, id: solution, solution: attributes_for(:solution, description: nil)
				expect(response).to render_template :edit
			end
		end
	end

	describe "DELETE #destroy" do
		it "deletes the Solution from the database" do
			expect{
				delete :destroy, errorlog_id: errorlog, id: solution
			}.to change(Solution, :count).by(-1)
		end
		it "redirects to errorlog#show page for related error" do
			delete :destroy, errorlog_id: errorlog, id: solution
			expect(response).to redirect_to errorlog_path
		end
	end
	
end