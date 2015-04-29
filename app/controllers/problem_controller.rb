class ProblemController < ApplicationController

	def archive
		@problems = Problem.all
	end

	def show
		@problem = Problem.find(params[:id])
	end

	def new
		@problem = Problem.new
	end

	def create
		@problem = current_user.problems.build(problem_params)
		if @problem.save
		# save returns a boolean that is true if problem is valid
			redirect_to root_url
		else
			flash[:danger] = @problem.errors.full_messages.first
			render 'new'
		end
	end

	private
		def problem_params
			params.require(:problem).permit(:title, :text)
		end
end
