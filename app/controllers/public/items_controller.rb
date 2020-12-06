class Public::ItemsController < ApplicationController
  layout 'public'

  def index
    @items = Item.all
    @itemAmount = Item.count
    @customer = current_customer
  end

  def show
    @item = Item.find(params[:id])
    @customer = current_customer
    @cartItem = CartItem.new
    if @cartItem.save(cartItem_params)
      flash[:notice] = "successfully added!"
      redirect_to public_cart_items_path
    else
      render :show
    end
  end




  private

  def cartItem_params
    params.permit(:item_id, :customer_id, :amount)
  end





end
