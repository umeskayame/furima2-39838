class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :house_number, :building, :phone, :item_id, :user_id

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'を入力してください' }
    validates :user_id
    validates :item_id
  end

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 配送先を保存する
    # purchase_idには、変数purchaseのidと指定する
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone: phone, purchase_id: purchase.id)
  end

  
end