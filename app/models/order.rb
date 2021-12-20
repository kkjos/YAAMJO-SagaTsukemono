class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_deposit:0, production_start:1, ready_to_ship:2, shipped:3}
end
