class SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :require_valid_user!, except: [:destroy]

  def new

  end
  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

end
