class SolutionsController < ApplicationController
	before_action :set_errorlog
	before_action :authenticate_user!, except: [:index, :show]

	def new
		@solution = Solution.new
		render layout: "dashboard_layout"
	end

	def create
		@solution = Solution.new(errorlog_id: @errorlog.id, description: solution_params[:description], 
														 worked: solution_params[:worked])
		if @solution.save
			flash[:success] = "Error Log was created!"
			redirect_to errorlog_path(@errorlog.id)
		else
			flash.now.alert = "There's an error with your error log. Inception much?"
	    render 'new'
		end
	end

	def show
		@solution = Solution.find(params[:id])
	end

	def edit
		@solution = Solution.find(params[:id])
		render layout: "dashboard_layout"
	end

	def update
		@solution = Solution.find(params[:id])
		if @solution.update(solution_params)
			flash[:success] = "Solution successfully updated!"
			redirect_to errorlog_solution_path(@errorlog, @solution)
		else
			flash.now.alert = "There was an error with updating this Solution."
			render 'edit'
		end
	end

	def destroy
		@solution = Solution.find(params[:id])
		@solution.delete
		redirect_to errorlog_path
	end

	private

	def set_errorlog
		@errorlog = Errorlog.find(params[:errorlog_id])
	  	rescue ActiveRecord::RecordNotFound
	    flash[:alert] = "The Errorlog you were looking for could not be found."
	end


	def solution_params
	  params.require(:solution).permit(:description, :worked)
	end

end