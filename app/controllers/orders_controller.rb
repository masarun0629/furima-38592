class OrdersController < ApplicationController
  before_action :authenticate_user!
 
  def index
   @item = Item.find(params[:item_id])
  if  current_user.id != @item.user.id && @item.order == nil
   @order_destination = OrderDestination.new
  else
    redirect_to root_path
  end
  end
 
 def create
  @item = Item.find(params[:item_id])
  @order_destination = OrderDestination.new(order_params)
  if @order_destination.valid?
     @order_destination.save
     redirect_to root_path
  else
     render :index
  end   
 end 

 private
 def order_params
  params.require(:order_destination).permit(:code,:prefecture_id,:city,:address,:building,:phone_number,:order_id).merge(user_id: current_user.id,item_id: @item.id)
 end
end
