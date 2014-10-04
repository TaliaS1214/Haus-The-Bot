class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user] = @user.id
    end
  end

  def destroy
    if session[:current_user] == params[:id].to_i
      session[:current_user] = nil
    end
  end

end
