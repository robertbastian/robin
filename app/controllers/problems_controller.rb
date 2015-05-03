class ProblemsController < ApplicationController

	def index
		@problems = Problem.all
	end

	def show
		@problem = Problem.find(params[:id])
		@solutions = @problem.solutions
	end

	def new
		@problem = Problem.new
	end

	def create
		# Only the last winner can create a problem
		if current_problem.winner == current_user
			@problem = current_user.problems.build(problem_params)
			@problem.expiry = (params[:time] || 3).days.from_now
			if @problem.save
			# save returns a boolean that is true if problem is valid
				redirect_to root_url
			else
				flash[:danger] = @problem.errors.full_messages.first
				render 'new'
			end
		else
			flash[:danger] = 'You can\'t set a problem now'
			redirect_to root_url
		end
	end

	private
	def problem_params
		params.require(:problem).permit(:title, :text)
	end
end
