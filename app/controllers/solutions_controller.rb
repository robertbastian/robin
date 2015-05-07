class SolutionsController < ApplicationController
	def new
		@problem = Problem.find(params[:problem_id])
		if @problem == most_recent_problem
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
		if most_recent_problem.id != params[:problem_id].to_i
			flash[:danger] = "You can't submit solutions for this problem anymore"
		elsif most_recent_problem.solutions.any? {|solution| solution.user == current_user}
			flash[:danger] = "You have already submitted a solution for this problem"
		else
			@solution = current_user.solutions.build(params.require(:solution).permit(:text))
			@solution.problem = most_recent_problem
			@solution.save
			@solution.problem.increment!(:score, by = params[:like].to_i)
			@solution.problem.author.increment!(:score, by = params[:like].to_i)
			# all users submitted
			if @solution.problem.solutions.length == User.count - 1
				@solution.problem.update(:expiry => DateTime.now)
			end
		end
			redirect_to most_recent_problem
	end
end
