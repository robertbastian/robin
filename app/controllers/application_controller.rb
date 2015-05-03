class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper
  include ApplicationHelper
  include UserHelper
  include ProblemHelper
	
  before_action :check_login
end
