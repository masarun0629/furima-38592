class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit,:show,:update]
  
 def index
  @items = Item.all.order(created_at: :desc)
 end 
 
 def new
  @item =  Item.new
 end
 
 def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
 end
 
 def show
 end 
 
 def edit
  unless current_user.id == @item.user.id && @item.order == nil
    redirect_to root_path 
  end
 end
 
 def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end  
 end
 
 def destroy
  item = Item.find(params[:id])
  if item.user_id == current_user.id
   item.destroy
   redirect_to root_path
  end
 end 

 
 
 private
 def item_params
   params.require(:item).permit(:image, :name, :explanation, :category_id,:situation_id,:load_id,:prefecture_id,:shipping_day_id,:price).merge(user_id: current_user.id)
 end
 
 def set_item
  @item = Item.find(params[:id])
 end
 
end
