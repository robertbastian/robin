class ProblemsController < ApplicationController

	def index
		@problems = Problem.all
	end

	def show
		@problem = Problem.find(params[:id])
		@solutions = @problem.solutions
	end

	def new
		@mrp = most_recent_problem
		if !@mrp || (@mrp.winner && @mrp.winner == current_user && !active_problem?)
			@problem = Problem.new
		else
			if !@mrp.winner flash[:danger] = "Last problem doesn't have a winner yet"
			else flash[:danger] = 'You shouldn\'t be here'
			end
			redirect_to root_url
		end
	end

	def create
		# Only the last winner can create a problem
		@problem = current_user.problems.build(problem_params)
		@problem.expiry = (params[:time] || 3).days.from_now
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
