FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name {'テスト'}
    first_name {'テスト'}
    kana_last_name {'テスト'}
    kana_first_name {'テスト'}
    birthday {2000-01-01}
  end
end