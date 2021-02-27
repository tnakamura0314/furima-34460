FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    text {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9_999_999)}
    category_id {Faker::Number.between(from: 2, to: 11)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    shopping_charge_id {Faker::Number.between(from: 2, to: 3)}
    prefectures_id {Faker::Number.between(from: 2, to: 48)}
    day_to_ship_id {Faker::Number.between(from: 2, to: 4)}
    association :user
  end
end
