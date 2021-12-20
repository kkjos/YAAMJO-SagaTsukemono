class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, uniqueness: { scope: :order_id }

  enum making_status: {waiting_for_production:0, production:1, production_completed:2}

  def subtotal
    price * amount
  end
end
