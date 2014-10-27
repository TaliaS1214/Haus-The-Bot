class SessionsController < ApplicationController

  def main
    @user = User.new
  end

  def about
  end

  def new

  end

  def create
    @user = User.find_by(handle: params[:handle])
    if @user && @user.authenticate(params[:password])
      session[:current_user] = @user.id
      redirect_to @user.house
    else
      @user = User.new
      render 'main'
    end
  end

  def destroy
    if session[:current_user] == params[:id].to_i
      session[:current_user] = nil
    end
    redirect_to '/'
  end

end
