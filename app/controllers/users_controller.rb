class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    u_params = params[:user]
    @user = User.new({handle: u_params[:handle], password: u_params[:password]})
    if u_params[:is_first] == 'on'
      h = House.create(name: u_params[:house_name])
      @user.house = h
      @user.save
      session[:current_user] = @user.id
      binding.pry
      flash[:welcome] = 'Invite housemates using your house pin!'
      redirect_to h
    else
      h = House.find_by_pin(u_params[:house_pin])
      if !h.nil?
        @user.house = h
        @user.save
        session[:current_user] = @user.id
        redirect_to h
      else
        flash.now[:house_error] = "We couldn't find a house matching that pin"
        render 'new'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:handle, :password, :is_first, :house_name, :house_pin)
  end

end
