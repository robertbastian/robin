class SessionsController < ApplicationController
  skip_before_action :check_login, only: [:new,:create]

  def new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
  	user = User.find_by(name: params[:session][:name].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to root_url
  	else
  		flash.now[:danger] = 'Invalid user/password combination'
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
  def faq
  end
end
