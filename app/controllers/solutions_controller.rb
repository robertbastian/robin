class SolutionsController < ApplicationController
	def new
		@problem = Problem.find(params[:problem_id])
		@solution = Solution.new
	end

	def show
		@solution = Solution.find(params[:id])
	end

	def create
		if current_problem.problem_id == params[:problem_id]
			@solution = current_user.solutions.build(params.require(:solution).permit(:text))
			current_problem.solutions.add(@solution)
			@solution.save
		else
			flash[:danger] = "You can't submit solutions for this problem anymore"
		end
		redirect_to @problem
	end
end
