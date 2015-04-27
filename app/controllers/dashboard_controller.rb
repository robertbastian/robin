class DashboardController < ApplicationController
	skip_before_action :check_login, only: [:front]
	def front
	end

	def dashboard
	end
end
