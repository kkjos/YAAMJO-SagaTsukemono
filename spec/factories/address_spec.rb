FactoryBot.define do
  factory :address do
    name { Faker::Name.name }
    postal_code { Faker::Number.number(digits: 7) }
    address { Faker::Internet.email }
    association :customer
  end
end