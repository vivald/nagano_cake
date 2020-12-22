class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  layout 'public'

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @add_tax = 1.10.round(1)
  end

  def create
    @customer = current_customer
    @cart_item = @customer.cart_items.build(create_item_params)
    @cart_items = @customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def create_item_params
    params.permit(:item_id, :customer_id, :amount)
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
