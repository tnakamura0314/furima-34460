class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
    validates :user
  end

  validates :price, numericality: { only_integer: true, message: "Half-width number"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Out of setting range"}

  with_options numericality: { other_than: 1, message: "Select"} do
    validates :category_id
    validates :condition_id
    validates :shopping_charge_id
    validates :prefectures_id
    validates :day_to_ship_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_charge
  belongs_to :prefectures
  belongs_to :day_to_ship

end
