module ApplicationHelper
	def check_login
		unless logged_in?
			redirect_to login_url
		end
	end
end
