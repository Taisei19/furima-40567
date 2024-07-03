class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number

  validates :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :phone_number, presence: true

  def save
    purchase = Record.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, record_id: purchase.id)
  end
end