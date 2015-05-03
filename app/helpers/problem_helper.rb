module ProblemHelper
	def active_problem?
		ps = Problem.order(:created_at => :desc)
		if ps.size == 0 then false else ps.first.expiry > DateTime.now end
	end

	def most_recent_problem
		Problem.order(:created_at => :desc).first
	end
end
