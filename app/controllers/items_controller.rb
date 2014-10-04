class ItemsController < ApplicationController

  def index
    house = House.find_by(id: params[:house_id])
    items = house.items
    render json: items.to_json, status: 200
  end

  def create
    house = House.find_by(id: params[:house_id])
    @item = Item.new(item_params)
    house.items << @item
    if @item.save
      render json: @item.to_json, status: 200
    end
  end

  def update
    @item = Item.find_by(id: params[:item_id])
    if @item.update!(item_params)
      render json: @item.to_json, status:200
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :type, :is_perishable?, :bought?)
  end

end
