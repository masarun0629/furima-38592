require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
  
    context '出品できる場合' do
    
    it 'すべての値が正確に入力されていれば出品できる' do
        expect(@item).to be_valid
    end  
     
    end
    
    context '出品できない場合' do
    
    it "imageが空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    it "nameが空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it "explanationが空では登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    
    it "priceが空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it "categoryが初期値では登録できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    
    it "loadが初期値では登録できない" do
      @item.load_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Load can't be blank")
    end
    
    it "prefectureが初期値では登録できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it "shipping_dayが初期値では登録できない" do
      @item.shipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    
    it "situationが初期値では登録できない" do
      @item.situation_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Situation can't be blank")
    end
    
    it "priceが全角だと登録できない" do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    
    it "priceが299以下だと登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    
    it "priceが10000000以上だと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    
    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    
    
   end  

  end

end  
