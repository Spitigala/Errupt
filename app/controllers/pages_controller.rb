class PagesController < ApplicationController
  def home
  	@public_errorlogs = Errorlog.where(public: true).order("created_at DESC")
  end

  def about
  end

  def dashboard
  	unless user_signed_in?
  		redirect_to new_user_session_path
  	end

    @user_errorlogs = Errorlog.where(user_id: current_user.id).order("created_at DESC")
  end

end
