require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      
    end
    it 'emailが空では登録できない' do
      
    end
    it 'emailが重複すると登録できない' do
      
    end
    it 'emailに@がなければ登録できない' do
      
    end
    it 'passwordが空では登録できない' do
      
    end
    it 'nicknameが6文字未満では登録できない' do
      
    end
    it 'passwordが半角英数字の混合でなければ登録できない' do
      
    end
    it 'パスワードとパスワード（確認）が不一致の場合登録できない' do
      
    end
    it 'last_nameが空では登録できない' do
      
    end
    it 'firsr_nameが空では登録できない' do
      
    end
    it 'last_nameが半角では登録できない' do
      
    end
    it 'first_nameが半角では登録できない' do
      
    end
    it 'kana_last_nameが空では登録できない' do
      
    end
    it 'kana_first_nameが空では登録できない' do
      
    end
    it 'kana_last_nameが全角（カタカナ）以外だと登録できない' do
      
    end
    it 'kana_first_nameが全角（カタカナ）以外だと登録できない' do
      
    end
    it 'birthdayが空では登録できない' do
      
    end
  end
end
