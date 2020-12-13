class Public::CartItemsController < ApplicationController


  layout 'public'


  def index
    @cart_items = CartItem.all
    # @sum_price = CartItem.sum_price
    @customer = current_customer
    @add_tax = 1.10.round(1)
    @cart_item = CartItem.new
  end

  def create
    @cart_item = current_customer.cart_items.build(create_item_params)
    @cart_items = current_customer.cart_items.all
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
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cartItem_params)
    redirect_to public_cart_items_path
  end

  def destroy
    cart_items = CartItem.find(params[:id])
    cart_items.destroy
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
