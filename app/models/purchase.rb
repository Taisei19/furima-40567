class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  validates :post_code, :prefecture_id, :city, :address, :phone_number, presence: true
  

  def save
    purchase = Record.new(user_id: user_id, item_id: item_id)
    if purchase.save
      buyer = Buyer.new(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, record_id: purchase.id)
      if buyer.save
        true
      else
        false
      end
    else
      false
    end
  end
end