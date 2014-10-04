class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if params[:is_first]
        puts params[:is_first]
        @user.house.create(params[:house_name])
      else
        house = House.find_by_pin(params[:house_pin])
        puts house
        @user.house = house
      end
      puts user
      # UserMailer.welcome_email(@user).deliver
      session[:current_user] = @user.id
      redirect '/', flash[:notice]="You signed up bunny"
    end
  end

  private

  def user_params
    params.require(:user).permit(:handle, :password)
  end

end
