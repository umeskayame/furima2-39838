FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'Faker::Internet.password(min_length: 6)'}
    password_confirmation {password}
    last_name {Faker::Name.initials(number: 2)}
    first_name {Faker::Name.initials(number: 2)}
    kana_last_name {Faker::Name.initials(number: 2)}
    kana_first_name {Faker::Name.initials(number: 2)}
    birthday {2000-01-01}
  end
end