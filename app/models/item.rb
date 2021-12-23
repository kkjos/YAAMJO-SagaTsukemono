class Item < ApplicationRecord
  has_many :order_details
  has_many :cart_items, dependent: :destroy
  belongs_to :material

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :capacity, presence: true

  attachment :image, destroy: false

  def with_tax_price
    (price * 1.08).floor
  end
end
