require 'rails_helper'
RSpec.describe Record, type: :model do
     
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user: @user)
      @record = FactoryBot.build(:record, user: @user, item: @item)
      @buyer = FactoryBot.build(:buyer, record: @record)
    end

  it "全ての欄に記入されている" do
    expect(@record).to be_valid
  end

  it "カード情報が入力できていないと購入できない" do
    @purchase = FactoryBot.build(:purchase, token: nil, user_id: @user.id, item_id: @item.id)
    expect(@purchase).to be_invalid 
    expect(@purchase.errors.full_messages).to include("Token can't be blank")  
  end

  it "郵便番号なしでは購入できない" do
    @buyer.post_code = ""
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Post code can't be blank")
  end

  it "郵便番号にハイフンがないと購入できない" do
    @buyer.post_code = "1234567"
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
  end

  it 'Prefecture_idが1では登録できない' do
    @buyer.prefecture_id = 1
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
  end
  
  it "住所なしでは購入できない" do
    @buyer.city = ""
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("City can't be blank")
  end

  it "番地なしでは購入できない" do
    @buyer.address = ""
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Address can't be blank")
  end
  
  it "電話番号なしでは購入できない" do
    @buyer.phone_number = ""
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
  end

  it "電話番号が9文字以下では購入できない" do
    @buyer.phone_number = "123456789"
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Phone number is too short")
  end

  it "電話番号に数字以外が入っていると購入できない。" do
    @buyer.phone_number = "123456789あ"
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Phone number is invalid. Input only number")
  end

end
