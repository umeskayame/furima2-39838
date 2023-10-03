FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'a11111'}
    password_confirmation {password}
    last_name {'こん'}
    first_name {'こん'}
    kana_last_name {'コン'}
    kana_first_name {'コン'}
    birthday {Faker::Date.birthday}
  end
end