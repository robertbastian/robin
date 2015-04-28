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
		# TODO: Clean up what happens on successful/unsuccessful saving
		if @problem.valid?
			@problem.save
		end
		redirect_to root_url
	end

	private
		def problem_params
			params.require(:problem).permit(:title, :text)
		end
end
