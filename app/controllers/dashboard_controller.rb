class DashboardController < ApplicationController
	skip_before_action :check_login, only: [:front]
	
	def front
		if logged_in?
			redirect_to dashboard_url
		end
	end

	def dashboard
		if question_master?
			@most_recent_problem = most_recent_problem
			render 'setter_dashboard'
		else
			
		end
		if active_problem?
			
		else
			
		end
	end
end
