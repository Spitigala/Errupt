class PagesController < ApplicationController
  def home
  	@public_errorlogs = Errorlog.where(public: true)
  end

  def about
  end

  def dashboard
  	unless user_signed_in?
  		redirect_to new_user_session_path
  	end
  end

end
