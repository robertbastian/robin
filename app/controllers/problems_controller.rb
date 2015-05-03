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
			flash[:danger] = 'That\'s just not allowed'
			if !@mrp.winner flash[:danger] = "Last problem doesn't have a winner yet"
			else flash[:danger] = 'You shouldn\'t be here'
			end
			redirect_to root_url
		end
	end
	def edit
		session[:return_to] ||= request.referer
		@problem = Problem.find(params[:id])
		if (current_user != @problem.user_id)
			flash[:danger] = "You are not the problem's writer"
			redirect_to session.delete(:return_to)
		end
		if @problem.solutions.empty? 
  	    then @possible_winners = User.all
  		else
  			@possible_winners = @problem.solutions.map{|s| User.find(s.user)}.uniq
  	  	end
	end

	def create
		# Only the last winner can create a problem
		@problem = current_user.problems.build(problem_params)
		@problem.expiry = 1.second.from_now #(params.permit(:time)[:time] || 3.days).from_now
		if @problem.save
		# save returns a boolean that is true if problem is valid
			redirect_to root_url
		else
			flash[:danger] = @problem.errors.full_messages.first
			render 'new'
		end
	end
	def update
		@problem = Problem.find(params[:id])
		if @problem.update(params.require(:problem).permit(:winner_id))
			redirect_to @problem
		else
			render 'edit'
		end
	end

	private
	def problem_params
		params.require(:problem).permit(:title, :text)
	end
end
