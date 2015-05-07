class DashboardController < ApplicationController
	skip_before_action :check_login, only: [:front, :faq]

	def front
		if logged_in?
			redirect_to dashboard_url
		end
	end

	def faq
	end

	def dashboard
		@leaders = User.order(:score => :desc)
		i = 0
		my_pos = @leaders.find_index(current_user)
		@start_pos = if my_pos == 0 then 0 elsif my_pos == User.count - 1 then User.count - 3 else my_pos - 1 end
    @most_recent_problem = most_recent_problem
	end
end
