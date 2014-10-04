class HousesController < ApplicationController

  def create
    @house = House.new(house_params)
    if @house.save
      render json: @house.to_json, status: 200
    end
  end

  def update
    @house = House.find_by(id: params[:id])
    @house.users << current_user
    if @house.update!(house_params)
      render json: @house.to_json, status:200
    end
  end

  private

  def item_params
    params.require(:house).permit(:name)
  end

end
