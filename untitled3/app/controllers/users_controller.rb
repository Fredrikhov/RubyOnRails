class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        if UserMailer.registration_confirmation(@user).deliver
        #session[:user_id] = @user.id
        flash[:success] = "registration complete, please verify account"
        redirect_to "/"
        else
          redirect_to "/"
          flash[:error] = "something went wrong"
          end
      else
        redirect_to "/"
        flash[:error] = "Something went wrong, please try again"
      end
    end


 def confirm_email
  @user = User.find_by_confirm_token(params[:id])
  if @user
    @user.email_activate
    flash[:success] = "Welcome, profil is activated. Please Log in."
    redirect_to "/"
  else
    flash[:error] = "Error: User does not exist"
    redirect_to "/"
  end
end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_conf)
  end
end
