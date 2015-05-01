class SolutionsController < ApplicationController
	def new
		@problem = Problem.find(params[:problem_id])
		if @problem == current_problem
			@solution = Solution.new
		else
			flash[:danger] = "You can't submit solutions for this problem anymore"
			redirect_to @problem
		end
	end

	def show
		@solution = Solution.find(params[:id])
	end

	def create
		if current_problem.id == params[:problem_id].to_i
			@solution = current_user.solutions.build(params.require(:solution).permit(:text))
			@solution.problem = current_problem
			@solution.save
			redirect_to current_problem
		else
			flash[:danger] = "You can't submit solutions for this problem anymore"
		end
	end
end
