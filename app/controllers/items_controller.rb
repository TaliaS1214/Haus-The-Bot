class ItemsController < ApplicationController
  include InboxTheApp


  def index
    house = House.find_by(id: params[:house_id])
    items = house.items
    render json: items.to_json, status: 200
  end

  def create
    house = House.find_by(id: params[:house_id])
    item = Item.new(item_params)
    house.items << item
    if item.save
      flash[:notice] = "error saving"
    end
    redirect_to house
  end

  def update
    @item = Item.find_by(id: params[:item_id])
    if @item.update!(item_params)
      render json: @item.to_json, status:200
    end
  end

  def hausthebott
    sender_handle = params['sender']['username']
    incoming_text = params['data']['text']
    house = User.find_by(handle: sender_handle).house
    outgoing_message = QueryParser.get_response(incoming_text, house)
    InboxTheApp.send_message(sender_handle, outgoing_message)
  end

  private

  def item_params
    params.require(:item).permit(:name, :type, :is_perishable?, :bought?)
  end


end
