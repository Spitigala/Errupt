require 'rails_helper'

describe ErrorlogsController do

	describe "GET #index" do
		it "populates an array of all public errorlogs" do
			errorlog1 = create(:errorlog)
			errorlog2 = create(:errorlog)
			get :index
			expect(assigns(:public_errorlogs)).to match_array([errorlog1, errorlog2])
		end

		it "renders the :index template" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe "GET #new" do
		it "assigns a new Errorlog to @errorlog" do
			get :new
			expect(assigns(:errorlog)).to be_a_new(Errorlog) 
		end

		it "renders the :new template" do
			get :new
			expect(response).to render_template :new
		end
	end

	describe "POST #create" do

		context "with valid attributes" do
			it "saves the new Errorlog in the database" do
				expect{
					post :create, errorlog: attributes_for(:errorlog)
				}.to change(Errorlog, :count).by(1)
			end

			it "redirects to show" do
				post :create, errorlog: attributes_for(:errorlog)
				expect(response).to redirect_to errorlog_path(assigns[:errorlog])
			end
		end

		context "with invalid attributes" do
			it "does not save the new Errorlog in the database" do
				expect{
					post :create, errorlog: attributes_for(:invalid_errorlog)
				}.to_not change(Errorlog, :count)
			end
			
			it "re-renders the :new template" do
				post :create, errorlog: attributes_for(:invalid_errorlog)
				expect(response).to render_template :new
			end
		end
	end

	describe "GET #show" do
		it "assigns the requested Errorlog to @errorlog" do
			errorlog = create(:errorlog)
			get :show, id: errorlog
			expect(assigns(:errorlog)).to eq errorlog
		end

		it "renders the :show template" do 
			errorlog = create(:errorlog)
			get :show, id: errorlog
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested Errorlog to @errorlog" do
			errorlog = create(:errorlog)
			get :edit, id: errorlog
			expect(assigns(:errorlog)).to eq errorlog
		end

		it "renders the :edit template" do
			errorlog = create(:errorlog)
			get :edit, id: errorlog
			expect(response).to render_template :edit
		end
	end

	describe "PATCH #update" do

		before :each do
			@errorlog = create(:errorlog, title: "Test error for update")
		end
		
		context "with valid attributes" do

			it "locates the requested @errorlog" do
				patch :update, id: @errorlog, errorlog: attributes_for(:errorlog)
				expect(assigns(:errorlog)).to eq(@errorlog)
			end


			it "updates the @errorlog's attributes in the database" do
				patch :update, id: @errorlog, errorlog: attributes_for(:errorlog, title: "updated title")
				@errorlog.reload
				expect(@errorlog.title).to eq("updated title")
			end

			it "redirects to show the updated errorlog" do
				patch :update, id: @errorlog, errorlog: attributes_for(:errorlog)
				expect(response).to redirect_to @errorlog
			end
		end

		context "with invalid attributes" do
			it "does not update the Errorlog in the database" do
				patch :update, id: @errorlog, errorlog: attributes_for(:errorlog, title: nil, description: "updated desc")
				@errorlog.reload
				expect(@errorlog.title).to_not eq(nil)
				expect(@errorlog.description).to_not eq("updated desc")
			end

			it "re-renders the :edit template" do
				patch :update, id: @errorlog, errorlog: attributes_for(:invalid_errorlog)
				expect(response).to render_template :edit
			end
		end
	end

	describe "DELETE #destroy" do

		before :each do
			@errorlog = create(:errorlog)
		end
		
		it "deletes the Errorlog from the database" do
			expect{
				delete :destroy, id: @errorlog
			}.to change(Errorlog, :count).by(-1)
		end

		it "redirects to errorlogs#index" do
			delete :destroy, id: @errorlog
			expect(response).to redirect_to errorlogs_url
		end

	end
	
end