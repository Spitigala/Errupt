require 'rails_helper'

describe TagsController do

	let!(:errorlog) do
		create(:errorlog)
	end

	let!(:tag1) do
		create(:tag)
	end

	let!(:tag2) do
		create(:tag)
	end

	let!(:errortag) do
		create(:error_tag, errorlog_id: errorlog.id, tag_id: tag1.id)
	end

	describe "GET #index" do
		# it "populates an array of all tags"
		# it "renders the :index template"
	end

	describe "GET #new" do
		it "assigns a new Tag to tag" do
			get :new, errorlog_id: errorlog
			expect(assigns(:tag)).to be_a_new(Tag)
		end
		it "renders the :new template" do
			get :new, errorlog_id: errorlog
			expect(response).to render_template :new
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new Tag in the database"do
				expect{
					post :create, errorlog_id: errorlog, tag: attributes_for(:tag)
				}.to change(Tag, :count).by(1)
			end
			it "redirects to errorlog#show page for related error" do
				post :create, errorlog_id: errorlog, tag: attributes_for(:tag)
				expect(response).to redirect_to  errorlog_path(errorlog)
			end
		end

		context "with invalid attributes" do
			it "does not save the new Tag in the database" do
				expect{
					post :create, errorlog_id: errorlog, tag: attributes_for(:invalid_tag)
				}.to_not change(Tag, :count)
			end
			it "re-renders the :new template"do
				post :create, errorlog_id: errorlog, tag: attributes_for(:invalid_tag)
				expect(response).to render_template :new
			end
		end
	end

	describe "GET #show" do
		# don't show individual tags, only a list of tags for a related error?
		# it "assigns the requested Tag to @tag"
		# it "renders the :show template"
	end

	describe "GET #edit" do
		# Don't allow tags to be edited. only create and delete?
		# it "assigns the requested Tag to tag"
		# it "renders the :edit template"
	end

	describe "PATCH #update" do
		# Don't allow tags to be edited. only create and delete?
		# context "with valid attributes" do
		# 	it "updates the Tag in the database"
		# 	it "redirects to show"
		# end

		# context "with invalid attributes" do
		# 	it "does not update the Tag in the database"
		# 	it "re-renders the :edit template"
		# end
	end

	describe "DELETE #destroy" do
		it "deletes a Tag from the database" do
			expect{
				delete :destroy, errorlog_id: errorlog, id: tag1
			}.to change(Tag, :count).by(-1)
		end
		it "redirects to tags#index page" do
			delete :destroy, errorlog_id: errorlog, id: tag1
			expect(response).to redirect_to errorlog_path
		end
	end
	
end