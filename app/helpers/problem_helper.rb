module ProblemHelper
	def current_problem?
		Problem.order(:created_at => :desc).first.expiry > DateTime.now
	end

	def current_problem
		if current_problem? then Problem.order(:created_at => :desc).first else throw Exception end
	end
end
