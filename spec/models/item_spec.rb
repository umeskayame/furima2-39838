require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品ができる場合' do
      it '商品の出品ができるとき' do
        expect(@item).to be_valid
      end
    end
  end
end

