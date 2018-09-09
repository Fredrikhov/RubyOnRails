class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :require_valid_user!

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_valid_user!
    if current_user.nil?
      flash[:error] = 'You must be logged in to access that page!'
    end
  end
end

