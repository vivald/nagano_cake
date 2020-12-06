class Public::CartItemsController < ApplicationController


  layout 'public'


  def index
    @cart_items = CartItem.all 
    @cart_item = CartItem.where(customer_id: current_customer.id)
    # @sum_price = CartItem.sum_price
    @customer = current_customer
  end
  
  def create
    @cart_items = CartItem.new(cartItem_params)
    @cart_items.customer_id = current_customer.id
    @cart_items.save
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
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to current_customer
  end

  def destroy
    @cart_item.destroy
    redirect_to current_customer
  end

  private

  def cartItem_params
    params.permit(:item_id, :customer_id, :amount)
  end


end
