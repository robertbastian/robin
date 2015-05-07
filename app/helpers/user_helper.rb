module UserHelper
	def question_master?
		most_recent_problem && current_user == most_recent_problem.author && most_recent_problem.winner == nil
	end

  def pointsFor user
    user.solutions.sum(:score) + user.problems.sum(:score)
  end
end
