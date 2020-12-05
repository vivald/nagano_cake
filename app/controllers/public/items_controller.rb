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
    @cartItem = CartItem.current_customer
  end
end
