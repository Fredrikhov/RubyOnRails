class SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :require_valid_user!, except: [:destroy]

  def new

  end
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if @user.email_con
      session[:user_id] = @user.id
      redirect_to '/'
      else
      flash[:error] = "Activate your account"
        redirect_to "/"
      end
      else
      flash[:error] = "Bad Passord/email"
      redirect_to '/'
      puts("error111111")
      end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
    flash[:danger] = "Logged out"
  end
end
