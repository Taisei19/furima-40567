class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :buyer, dependent: :destroy

  validates :user, presence: true
  validates :item, presence: true

end
