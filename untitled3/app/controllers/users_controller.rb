class UsersController < ApplicationController
  #attr_accessor :email, :password, :password_conf
  # Must use strong params
  #

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
      flash[:danger] = "Velkommen tilbake"
    else
      flash[:danger] = "Felter kan ikke være tomme"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_conf)
  end
end
