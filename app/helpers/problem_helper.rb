module ProblemHelper
	def current_problem 
		Problem.order(:created_at => :desc).first
	end
end
