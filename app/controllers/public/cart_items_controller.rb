class Public::CartItemsController < ApplicationController
  layout 'public'

  def index
    @customer = current_customer
    @cartItems = @customer.cart_items.all
  end

  def create
    @cartItem = CartItem.new(cartItem_params)
    if @cartItem.save
      flash[:notice] = "successfully added!"
      redirect_to public_cart_items_path
    else
      @customer = current_customer
      render :index
    end
  end

  private
  def cartItem_params
    params.permit(:item_id, :customer_id, :amount)
  end

end
