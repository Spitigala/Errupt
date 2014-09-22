class TagsController < ApplicationController

	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(tag_params)
		if @tag.save
			# @error_tag = ErrorTag.create(errorlog_id: @errorlog.id, tag_id: @tag.id)
			flash[:success] = "Tag was created!"
			redirect_to tag_path(@tag)
		else
			flash.now.alert = "There's an error with your Tag."
	    render 'new'
		end
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.delete
		redirect_to errorlog_path
	end

	private

	def tag_params
	  params.require(:tag).permit(:tag_name)
	end

end