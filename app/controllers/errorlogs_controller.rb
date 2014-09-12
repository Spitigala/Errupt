class ErrorlogsController < ApplicationController
  def index
 		@current_user = current_user
  end

  def show

  end

  def new
  	render 'new'
  end

  def create
  	@new_error = Error.new(organization_params)

  	if @new_error.save
  		flash[:success] = "Error Log was created!"
  		redirect_to errorlogs_path
  	else
  		flash.now.alert = "There's an error with your error log. Inception much?"
  	end

  end

  def edit
  	
  end

  def update
  end

  def delete
  end

end
