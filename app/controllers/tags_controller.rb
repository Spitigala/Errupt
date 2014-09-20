class TagsController < ApplicationController
	before_action :set_errorlog

	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(tag_params)
		if @tag.save
			# @error_tag = ErrorTag.create(errorlog_id: @errorlog.id, tag_id: @tag.id)
			flash[:success] = "Tag was created!"
			redirect_to errorlog_path(@errorlog.id)
		else
			flash.now.alert = "There's an error with your Tag."
	    render 'new'
		end
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.delete
		redirect_to errorlog_path
	end

	private

	def set_errorlog
		@errorlog = Errorlog.find(params[:errorlog_id])
	  	rescue ActiveRecord::RecordNotFound
	    flash[:alert] = "The Errorlog you were looking for could not be found."
	end


	def tag_params
	  params.require(:tag).permit!
	end

end