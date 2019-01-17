FactoryBot.define do
  factory :value do
    price          {Faker::Number.leading_zero_number(6)}
    profit         {Faker::Number.leading_zero_number(6)}
    association :item
  end
end
