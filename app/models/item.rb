class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  attachment :image
  
  # validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20}
  # validates :introduction, length: { maximum: 50}
end
