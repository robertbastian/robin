class UsersController < ApplicationController
	skip_before_action :check_login, only: [:new,:create]

	def index
		@users = User.all.sort_by {|u| (- (pointsFor u)) }
	end

	def show
		@user = User.find_by_name(params[:id])
		@me = @user == @current_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		agree = params[:agree_to_tos]

		if @user.valid? and agree == '1'
			@user.save
			log_in @user
			redirect_to root_url
		else
			flash[:danger] = @user.errors.full_messages.first
			if agree != '1'
				flash[:danger] = "You must accept the Terms of Service"
			end
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
