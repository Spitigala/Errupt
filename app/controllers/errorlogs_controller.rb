class ErrorlogsController < ApplicationController
  def index
 		@public_errorlogs = Errorlog.where(public?: true)
  end

  def show
    @errorlog = Errorlog.find(params[:id])
  end

  def new
    @errorlog = Errorlog.new
  end

  def create
  	@errorlog = Errorlog.new(errorlog_params)

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
    redirect_to errorlogs_path
  end

  private

  def errorlog_params
    params.require(:errorlog).permit!
  end

end
