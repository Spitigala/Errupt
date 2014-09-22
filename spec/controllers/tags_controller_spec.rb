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

	describe "GET #new" do
		it "assigns a new Tag to tag" do
			get :new
			expect(assigns(:tag)).to be_a_new(Tag)
		end
		it "renders the :new template" do
			get :new
			expect(response).to render_template :new
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new Tag in the database"do
				expect{
					post :create, tag: attributes_for(:tag)
				}.to change(Tag, :count).by(1)
			end
			it "redirects to tag#show page for related error" do
				post :create, tag: attributes_for(:tag)
				expect(response).to redirect_to tag_path(assigns[:tag])
			end
		end

		context "with invalid attributes" do
			it "does not save the new Tag in the database" do
				expect{
					post :create, tag: attributes_for(:invalid_tag)
				}.to_not change(Tag, :count)
			end
			it "re-renders the :new template"do
				post :create, tag: attributes_for(:invalid_tag)
				expect(response).to render_template :new
			end
		end
	end

	describe "DELETE #destroy" do
		it "deletes a Tag from the database" do
			expect{
				delete :destroy, id: tag1
			}.to change(Tag, :count).by(-1)
		end
		it "redirects to errorlog page" do
			delete :destroy, id: tag1
			expect(response).to redirect_to errorlog_path
		end
	end
	
end