class Buyer < ApplicationRecord
  belongs_to :record

  validates :post_code,     presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,          presence: true
  validates :address,       presence: true
  validates :phone_number,  presence: true

end
