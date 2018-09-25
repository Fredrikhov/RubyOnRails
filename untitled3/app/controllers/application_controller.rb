class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :require_valid_user!, :set_article_all
  # Redirect missing template : rescue_from ActionView::MissingTemplate, :with => :template_not_found
  # Redirect link to a page that dosent exist´

  #Handle routing error in ruby 5

  rescue_from ActionController::RoutingError do |exception|
    logger.error 'Routing error occurred'
    render partial: '404/error', status: 404
  end



  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_valid_user!
    if current_user.nil?
    end
  end
  def authorize
    redirect_to '/' unless current_user
      if current_user.nil?
      flash[:error] = "Need to log in to access"
      end
  end

  private
  def set_article_all
    @article = Article.all
  end

  def template_not_found
    redirect_to "/"
  end

end

