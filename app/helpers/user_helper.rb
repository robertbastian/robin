module UserHelper
	def question_master?
		most_recent_problem && current_user == most_recent_problem.author && most_recent_problem.winner == nil
	end
end
