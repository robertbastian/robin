class UserController < ApplicationController
	skip_before_action :check_login, only: [:new,:create]
	
	def leaderboard
		@users = User.order(score: :desc)
	end

	def show
		@user = User.find_by(name: params[:name])
		@problems = @user.problems
		@solutions = @user.solutions
		@me = @user == @current_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			log_in @user
			redirect_to root_url
		else
			flash[:danger] = @user.errors.full_messages.first
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
