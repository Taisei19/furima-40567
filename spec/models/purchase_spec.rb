require 'rails_helper'
RSpec.describe Purchase, type: :model do

    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user: @user)
      @record = FactoryBot.build(:record, user: @user, item: @item)
      @purchase = FactoryBot.build(:purchase, user_id: @user.id, item_id: @item.id)
    end

  context '登録できる場合' do
    it "全ての欄に記入されている" do
      expect(@record).to be_valid
    end

    it "建物名が空でも購入できる" do
      @purchase.building = ""
      expect(@purchase).to be_valid
    end
  end

  context '登録できない場合' do
    it "カード情報が入力できていないと購入できない" do
     @purchase = FactoryBot.build(:purchase, token: nil, user_id: @user.id, item_id: @item.id)
     expect(@purchase).to be_invalid 
     expect(@purchase.errors.full_messages).to include("Token can't be blank")  
     end


    it "郵便番号なしでは購入できない" do
      @purchase.post_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code can't be blank")
    end

    it "郵便番号にハイフンがないと購入できない" do
      @purchase.post_code = "1234567"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it 'Prefecture_idが1では登録できない' do
      @purchase.prefecture_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
  
    it "住所なしでは購入できない" do
      @purchase.city = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it "番地なしでは購入できない" do
      @purchase.address = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Address can't be blank")
    end
  
    it "電話番号なしでは購入できない" do
      @purchase.phone_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が9桁以下では登録できない" do
      @purchase.phone_number = "123456789"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is too short")
    end

    it "電話番号が12桁以上では登録できない" do
      @purchase.phone_number = "123456789012"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is too long")
    end

    it "電話番号に数字以外が入っていると購入できない。" do
      @purchase.phone_number = "123456789あ"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid. Input only number")
    end

    it "user_idが空だと登録できない" do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end
  
    it "item_idが空だと登録できない" do
      @purchase.item_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Item can't be blank")
    end
  end
end
