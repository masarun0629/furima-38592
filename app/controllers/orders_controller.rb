class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:create]
  
  def index
  if  current_user.id != @item.user.id && @item.order == nil
   @order_destination = OrderDestination.new
  else
    redirect_to root_path
  end
  end
 
 def create
  @order_destination = OrderDestination.new(order_params)
  if @order_destination.valid?
     pay_item
     @order_destination.save
     redirect_to root_path
  else
     render :index
  end   
 end 

 private
 
 def order_params
  params.require(:order_destination).permit(:code,:prefecture_id,:city,:address,:building,:phone_number,:order_id,).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
 end
 
 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  
    card: order_params[:token],    
    currency: 'jpy'                 
    )
 end
 
 def set_item
  @item = Item.find(params[:item_id])
 end 

end
