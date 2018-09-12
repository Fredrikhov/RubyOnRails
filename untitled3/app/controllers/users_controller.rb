class UsersController < ApplicationController
  #attr_accessor :email, :password, :password_conf
  # Must use strong params
  #

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/"
      else
        format.html{ render action: 'new'}
        format.json {render js: @user.errors}
      end
    end

      end

  def user_params
    params.require(:user).permit(:email, :password, :password_conf)
  end
end
