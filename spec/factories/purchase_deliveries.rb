FactoryBot.define do
  factory :purchase_delivery do
    postcode { '123-4567' }
    prefecture_id { 20 }
    city { '東京都' }
    house_number { '1-1' }
    building { 'こんハイツ' }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
