class Public::CartItemsController < ApplicationController


  layout 'public'


  def index
    @cart_items = CartItem.all
    # @sum_price = CartItem.sum_price
    @customer = current_customer
    @add_tax = 1.10.round(1)
  end

  def create
    cart_items = CartItem.new(createItemParams)
    cart_items.customer_id = current_customer.id
    cart_items.save
    redirect_to public_cart_items_path
  end
  # def index
  #   @customer = current_customer
  #   @cart_items = @customer.cart_items
  # end

  # def create
  # #   if @cart_items.blank?
  # #     @cart_items = current_customer.cart_items.build(item_id: params[:item_id])
  # #   end

  #   @cart_items = CartItem.new(cartItem_params)
  #   @cart_items.save
  #   redirect_to public_cart_items_path
  #   # @cartItem = CartItem.new(cartItem_params)
  #   # if @cartItem.save
  #   #   flash[:notice] = "successfully added!"
  #   #   redirect_to public_cart_items_path
  #   # else
  #   #   @customer = current_customer
  #   #   render :index
  #   # end
  # end

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

  def createItemParams
    params.permit(:item_id, :customer_id, :amount)
  end

  def cartItem_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end


end
