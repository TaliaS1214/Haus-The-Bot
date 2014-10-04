class SessionsController < ApplicationController

  def main

  end

  def new

  end

  def create
    @user = User.find_by(handle: params[:handle])
    if @user && @user.authenticate(params[:password])
      session[:current_user] = @user.id
      redirect_to @user.house
    else
      render 'new'
    end
  end

  def destroy
    if session[:current_user] == params[:id].to_i
      session[:current_user] = nil
    end
    redirect_to '/'
  end

end
