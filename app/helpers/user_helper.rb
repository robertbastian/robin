module UserHelper
	def question_master?
		most_recent_problem && current_user == most_recent_problem.author && most_recent_problem.winner == nil
	end
  # cool, eventually we could parameterise this when we have more complex
  # "score", and display different aspects of the score.
  def pointsFor user
    user.solutions.sum(:score) + user.problems.sum(:score)
  end
end
