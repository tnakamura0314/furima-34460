class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :shopping_charge_id
    validates :prefectures_id
    validates :day_to_ship_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Half-width number"}
    validates :user
  end

  belongs_to :user
  has_one_attached :image

end
