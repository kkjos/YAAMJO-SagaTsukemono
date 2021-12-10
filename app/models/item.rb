class Item < ApplicationRecord
  has_many :order_details
  has_many :cart_items, dependent: :destroy
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :image, presence: true
  
  attachment :image, destroy: false
end
