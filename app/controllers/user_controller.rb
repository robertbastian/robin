class UserController < ApplicationController

	def index
		@users = User.order(score: :desc)
	end

	def show
		@user = User.find_by(name: params[:name])
		@me = @user[:id] == session[:userid]
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		@user.save
		redirect_to action: :index
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
