class ErrorlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @public_errorlogs = Errorlog.where(public: true).order("created_at DESC").paginate(per_page: 10, page: params[:page])

    if params[:public_tag]
      @public_errorlogs = @public_errorlogs.public_tagged_with(params[:public_tag])
    else
      @public_errorlogs
    end
  end

  def show
    @errorlog = Errorlog.find(params[:id])
    
    if @errorlog.user == current_user
      render layout: "dashboard_layout"
    end
  end

  def new
    @errorlog = Errorlog.new
    render layout: "dashboard_layout"
  end

  def create
    @errorlog = current_user.errorlogs.build(errorlog_params)

    if @errorlog.save
      flash[:success] = "Error Log was created!"
      redirect_to errorlog_path(@errorlog.id)
    else
      flash.now.alert = "There's an error with your error log. Inception much?"
      render 'new'
    end

  end

  def edit
    @errorlog = Errorlog.find(params[:id])
    render layout: "dashboard_layout"
  end

  def update
    @errorlog = Errorlog.find(params[:id])
    if @errorlog.update(errorlog_params)
      flash[:success] = "Errorlog successfully updated!"
      redirect_to errorlog_path(@errorlog.id)
    else
      flash.now.alert = "There was an error with updating this Error Log."
      render 'edit'
    end
  end

  def destroy
    @errorlog = Errorlog.find(params[:id])
    @errorlog.delete
    redirect_to dashboard_path
  end

  private

  def errorlog_params
    params.require(:errorlog).permit(:title, :description, :os, :os_version, :language, 
      :language_version, :framework, :framework_version, :public, :image, :content_type, :tag_list, :tag_name)
  end

end