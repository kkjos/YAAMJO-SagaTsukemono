FactoryBot.define do
  factory :item do
    name { Faker::Food.vegetables }
    introduction { Faker::Food.description }
    capacity { Faker::Number.number(digits: 3) }
    price { Faker::Number.number(digits: 3) }
    association :material
  end
end