require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery).to be_valid
        sleep 1
      end
      it '建物名は空でも保存できること' do
        @purchase_delivery.building =''
        expect(@purchase_delivery).to be_valid
        sleep 1
      end
      it 'tokenがあれば保存できること' do
        expect(@purchase_delivery).to be_valid
        sleep 1
      end  
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @purchase_delivery.postcode = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postcode can't be blank")
        sleep 1
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_delivery.postcode = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
        sleep 1
      end
      it '都道府県を選択していないと保存できない' do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
        sleep 1
      end
      it '市区町村が空だと保存できない' do
        @purchase_delivery.city = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
        sleep 1
      end
      it '番地が空だと保存できない' do
        @purchase_delivery.house_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("House number can't be blank")
        sleep 1
      end
      it '電話番号が空だと保存できない' do
        @purchase_delivery.phone = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone is invalid")
        sleep 1
      end
      it '電話番号にハイフンを含むと保存できない' do
        @purchase_delivery.phone = '090-1234-5678'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone is invalid")
        sleep 1
      end
      it '電話番号が9桁以下の場合登録できない' do
        @purchase_delivery.phone = '09012345'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone is invalid")
        sleep 1
      end
      it '電話番号が12桁以上の場合登録できない' do
        @purchase_delivery.phone = '0901234567890123'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone is invalid")
        sleep 1
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
        sleep 1
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
        sleep 1
      end
      it "tokenが空では登録できないこと" do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
        sleep 1
      end
    end
  end  
end
