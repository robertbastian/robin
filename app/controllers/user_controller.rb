class UserController < ApplicationController
	before_action :check_login
	
	def leaderboard
		@users = User.order(count: :desc)
	end

	def show
		@user = User.find_by(name: params[:name])
		@me = @user == @current_user
	end

	def profile
		@user = current_user
		render 'show'
	end

	def new
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to action: :profile
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
