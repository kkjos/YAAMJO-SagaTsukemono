FactoryBot.define do
  factory :customer do
    transient do
      person { Gimei.name }
    end
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana{ person.last.katakana }
    first_name_kana{ person.first.katakana }
    postal_code { Faker::Number.number(digits:7) }
    address { Faker::Internet.email }
    telephone_number { Faker::Number.number(digits:10) }
  end
end