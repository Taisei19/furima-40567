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

  it "郵便番号なしでは購入できない" do
    @buyer.post_code = ""
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Post code can't be blank")
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
end