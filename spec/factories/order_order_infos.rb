FactoryBot.define do
  factory :order_order_info do
    postal_code {"123-4567"}
    prefectures_id {Faker::Number.between(from: 2, to: 48)}
    municipality {"横浜市緑区"}
    address {"青山1-1-1"}
    building_name {"柳ビル103"}
    phone_number {"09071824624"}
    item_id {1}
  end
end
