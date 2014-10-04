class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    u_params = params[:user]
    @user = User.new({handle: u_params[:handle], password: u_params[:password]})
      if @user.save
        if u_params[:is_first]
          h = House.create(name: u_params[:house_name])
          puts h.name
        else
          h = House.find_by_pin(u_params[:house_pin])
          puts h.name
        end
        @user.house = h
        # UserMailer.welcome_email(@user).deliver
        session[:current_user] = @user.id
        redirect_to root_path
      else
        render 'new'
      end
  end

  private

  def user_params
    params.require(:user).permit(:handle, :password, :is_first, :house_name, :house_pin)
  end

end
