require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination,item_id: item.id,user_id: user.id)
    end
  
    context '購入できる場合' do
      
      it 'カードと届け先の値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      
      it 'buildingは空でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
      
      it 'phome_numberは10桁でも保存できること' do
        @order_destination.phone_number = '0805864242'
        expect(@order_destination).to be_valid
      end
    
    end  
  
    context '購入できない場合' do
      
      it "codeが空では登録できない" do
        @order_destination.code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Code can't be blank")
      end
    
      it "prefecture_idが初期値では登録できない" do
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
    
      it "cityが空では登録できない" do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
    
      it "addressが空では登録できない" do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
    
      it "phone_numberが空では登録できない" do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it "codeが全角では登録できない" do
        @order_destination.code = "９５０-０１２３"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Code is invalid")
      end
      
      it "codeにハイフンが含まれていないと登録できない" do
        @order_destination.code = "9500123"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Code is invalid")
      end
      
      it "phone_numberが全角では登録できない" do
        @order_destination.phone_number = '０８０５８６４２４２４'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      
      it "phone_numberが9桁以下では登録できない" do
        @order_destination.phone_number = '080586424'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      
      it "phone_numberが12桁以上では登録できない" do
        @order_destination.phone_number = '080586424242'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      
      it "phone_numberにハイフンを含めると登録できない" do
        @order_destination.phone_number = '080-5864-2424'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      
      it "tokenが空では登録できない" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    
      it 'userのIDが紐付いていないと登録できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      
      it 'itemのIDが紐付いていないと登録できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
      
    end  
  end
end 