class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :period


  validates :name, :explanation, :price, presence: true

  validates :category_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :payer_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :period_id,     numericality: { other_than: 1, message: "can't be blank" }

end