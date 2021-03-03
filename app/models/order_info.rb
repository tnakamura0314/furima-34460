class OrderInfo < ApplicationRecord
  validates :order, presence: true

  belongs_to :order
end
