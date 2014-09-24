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
    @user_errorlogs.each do |err|
      err.tags.map(&:tag_name).map
    end

    if params[:tag]
      @user_errorlogs = @user_errorlogs.tagged_with(params[:tag])
    else
      @user_errorlogs
    end

    render layout: "dashboard_layout"

  end

end
