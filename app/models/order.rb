class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :take_item_names, through: :order_details, source: :item

  accepts_nested_attributes_for :order_details, allow_destroy: true # fields_forに必要

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }

  # enum payment_method: [['クレジットカード', 0], ['銀行振込', 1]]
  # enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end
