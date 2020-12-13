class Form::OrderCollection < Form::Base
  @item_register_quantity = 0
  @cart_items.each do |cart_item| 
    @item_register_quantity += 1
  end

  FORM_COUNT = @item_register_quantity #ここで、作成したい登録フォームの数を指定
  attr_accessor :orders

  def initialize(attributes = {})
    super attributes
    self.orders = FORM_COUNT.times.map { Order.new() } unless self.orders.present?
  end

  def products_attributes=(attributes)
    self.orders = attributes.map { |_, v| Order.new(v) }
  end

  def save
    Order.transaction do
      self.orders.map do |order|
        if order.availability # ここでチェックボックスにチェックを入れている商品のみが保存される
          order.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end