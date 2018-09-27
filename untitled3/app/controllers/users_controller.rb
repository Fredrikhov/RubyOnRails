class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to "/", notice: 'Saved successfully.' }
      else
        redirect_to "/signup"
        flash[:error] = "Something went wrong. Please try again"
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_conf)
  end
end
