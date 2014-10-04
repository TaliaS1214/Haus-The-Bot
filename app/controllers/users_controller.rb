class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      session[:current_user] = @user.id
    end
  end

  private

  def user_params
    params.require(:user).permit(:handle, :password)
  end

end
