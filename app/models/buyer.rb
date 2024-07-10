class Buyer < ApplicationRecord
  belongs_to :record

validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
validates :city, presence: true
validates :address, presence: true
validates :phone_number, presence: true, length: { minimum: 10, maximum: 11, too_short: "is too short", too_long: "is too long" }, format: { with: /\A\d+\z/ , message: "is invalid. Input only number" }

end
