class DashboardController < ApplicationController
	skip_before_action :check_login, only: [:front]
	
	def front
		if logged_in?
			redirect_to dashboard_url
		end
	end

	def dashboard
		@most_recent_problem = most_recent_problem
	end
end
