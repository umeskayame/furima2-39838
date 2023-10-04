class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image
end
