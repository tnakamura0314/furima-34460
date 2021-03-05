class OrderOrderInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "Input only number"}
    validates :user_id
    validates :item_id
  end

  validates :prefectures_id, numericality: {other_than: 1, message: "Select"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderInfo.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end