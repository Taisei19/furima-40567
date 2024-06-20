class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, confirmation: true
  validates :nickname, presence: true
  validates :familyname_kanji, presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/ }
  validates :firstname_kanji, presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/ }
  validates :familyname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

end
