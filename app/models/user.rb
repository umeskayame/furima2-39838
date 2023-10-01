class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: {
           with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         },on: :create
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name, format: {
    with: /\A[ぁ-んァ-ヶ一-龥]/
  },on: :create
  validates :first_name, format: {
    with: /\A[ぁ-んァ-ヶ一-龥]/
  },on: :create
  validates :kana_last_name, format: {
    with: /\A[ァ-ヶー－]+\z/
  },on: :create
  validates :kana_first_name, format: {
    with: /\A[ァ-ヶー－]+\z/
  },on: :create
  validates :birthday, presence: true

end
