class Public::OrdersController < ApplicationController
  layout 'public'

  def new
    @customer = current_customer
    @addresses = @customer.addresses.all
    @order = Order.new
  end

  def confirm
    @customer = current_customer
    if params[:order][:address_option] == "0"
      order = Order.new(order_params)
      order.customer_id = current_customer.id
      @cart_items = @customer.cart_items.all
      @add_tax = 1.1
    elsif params[:order][:address_option] == "1"
      order = Order.new(another_order_params)
      order.customer_id = current_customer.id
    elsif params[:order][:address_option] == "2"
      order = Order.new(new_add_params)
      order.customer_id = current_customer.id
    end
  end

  def complete
  end

  def index
    @customer = current_customer
  end

  def show
     @customer = current_customer
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end

  def another_order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end


  def new_add_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end

end
