class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :item_id, uniqueness: { scope: :customer_id }

  def with_tax_price
    (item.price * 1.08).floor
  end

  def subtotal
    with_tax_price * amount
  end
end
