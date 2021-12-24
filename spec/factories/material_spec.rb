FactoryBot.define do
  factory :material do
    name { Faker::Food.vegetables }
  end
end