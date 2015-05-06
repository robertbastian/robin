class DashboardController < ApplicationController
	skip_before_action :check_login, only: [:front]
	
	def front
		if logged_in?
			redirect_to dashboard_url
		end
	end

	def dashboard
		@leaders = User.order(:score => :desc).limit(3)
                @most_recent_problem = most_recent_problem
	end
end
