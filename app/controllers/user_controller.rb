class UserController < ApplicationController

	def index
		@users = User.order(points: :desc)
	end

	def show
		@user = User.find(params[:name])
		@me = @user[:id] == session[:userid]
	end
end