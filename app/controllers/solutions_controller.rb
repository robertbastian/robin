class SolutionsController < ApplicationController
	def new
		@problem = Problem.find(params[:problem_id])
		@solution = Solution.new
	end
	def show
		@solution = Solution.find(params[:id])
	end
	def create
		@solution = current_user.solutions.build(solution_params)
		@solution.save
		@problem = Problem.find(params[:problem_id])
		redirect_to @problem
	end

	private
		# Not sure if this is tidiest thing to do:
		# Get the :text from the form for the solution, and then tack on the problem_id
		# which is just floating around in params
		def solution_params
			params.require(:solution).permit(:text).update(problem_id: params[:problem_id])
		end
end
