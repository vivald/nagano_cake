class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  layout 'public'

  def new
    @customer = current_customer
    @addresses = @customer.addresses.all
    @order = Order.new
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @add_tax = 1.1
    @order = Order.new
    @order.order_details.build
    if params[:order][:payment_method] == "クレジットカード"
      @payment_method = "クレジットカード"
    elsif params[:order][:payment_method] == "銀行振込"
      @payment_method = "銀行振込"
    end
    if params[:order][:address_option] == "0"
      @postal_code = @customer.postal_code
      @delivery_address = @customer.address
      @full_name = (@current_customer.last_name + @current_customer.first_name)
    elsif params[:order][:address_option] == "1"
      find_another_address_id = Address.find(params[:order][:another_address])
      @postal_code = find_another_address_id.postal_code
      @delivery_address = find_another_address_id.address
      @full_name = find_another_address_id.name
    elsif params[:order][:address_option] == "2"
      order = Order.new(new_add_address_params)
      order.save
      @postal_code = order.postal_code
      @delivery_address = order.address
      @full_name = order.name
    end
  end

  def create
    order = Order.new(complete_params)
    order.save
    current_customer.cart_items.destroy_all
    redirect_to public_orders_complete_path
  end

  def complete
    @customer = current_customer
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @add_tax = 1.1
  end

  private

  def new_add_address_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end

  def complete_params
    params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status, order_details_attributes: [:order_id, :item_id, :price, :amount])
  end
end
