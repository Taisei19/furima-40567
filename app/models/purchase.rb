class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :token
  
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :city
    validates :address
    validates :phone_number, length: { minimum: 10, maximum: 11, too_short: "is too short", too_long: "is too long" }, format: { with: /\A\d+\z/ , message: "is invalid. Input only number" }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

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