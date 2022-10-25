require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
   
    context '新規登録できる場合' do
    
    it 'すべての値が正確に入力されていれば登録できる' do
      expect(@user).to be_valid
    end  
   
    end 
   
    context '新規登録できない場合' do
    
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '12345a'
      @user.password_confirmation = '123456a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it 'passwordが英語のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it 'passwordが全角では登録できない' do
      @user.password = '１A３C５E'
      @user.password_confirmation = '１A３C５E'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    
    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    
    it "birth_dayが空では登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    
    it "last_nameに全角数字が含まれていると登録できない" do
      @user.last_name = '５'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    
    it "last_nameに半角数字が含まれていると登録できない" do
      @user.last_name = '5'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    
    it "last_nameに全角英語が含まれていると登録できない" do
      @user.last_name = 'ａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    
    it "last_nameに半角英語が含まれていると登録できない" do
      @user.last_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
   
    it "first_nameに全角数字が含まれていると登録できない" do
      @user.first_name = '５'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it "first_nameに半角数字が含まれていると登録できない" do
      @user.first_name = '5'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it "first_nameに全角英語が含まれていると登録できない" do
      @user.first_name = 'ａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it "first_nameに半角英語が含まれていると登録できない" do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
   
    it "last_name_kanaに全角数字が含まれていると登録できない" do
      @user.last_name_kana = '５'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    it "last_name_kanaに半角数字が含まれていると登録できない" do
      @user.last_name_kana = '5'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    it "last_name_kanaに全角英語が含まれていると登録できない" do
      @user.last_name_kana = 'ａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    it "last_name_kanaに半角英語が含まれていると登録できない" do
      @user.last_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    it "last_name_kanaにひらがなが含まれていると登録できない" do
      @user.last_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    it "last_name_kanaに漢字が含まれていると登録できない" do
      @user.last_name_kana = '亜'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    it "first_name_kanaに全角数字が含まれていると登録できない" do
      @user.first_name_kana = '５'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it "first_name_kanaに半角数字が含まれていると登録できない" do
      @user.first_name_kana = '5'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it "first_name_kanaに全角英語が含まれていると登録できない" do
      @user.first_name_kana = 'ａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it "first_name_kanaに半角英語が含まれていると登録できない" do
      @user.first_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it "first_name_kanaにひらがなが含まれていると登録できない" do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it "first_name_kanaに漢字が含まれていると登録できない" do
      @user.first_name_kana = '亜'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
   
   end
  end  
end
