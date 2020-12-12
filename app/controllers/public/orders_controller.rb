class Public::OrdersController < ApplicationController
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
    if params[:order][:payment_method] == "クレジットカード"
      @payment_method = "クレジットカード"
    elsif params[:order][:payment_method] == "銀行振込"
      @payment_method = "銀行振込"
    end
    if params[:order][:address_option] == "0"
      @postal_code = (@customer.postal_code)
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
      render :confirm
    end
  end

  def create
    @order = Order.new(complete_params)
    @order.save
    redirect_to public_orders_complete_path
  end

  def complete
    @customer = current_customer
  end

  def index
    @customer = current_customer
  end

  def show
     @customer = current_customer
  end

  private

  def new_add_address_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end

  def complete_params
    params.permit(:customer_id, :payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
  end

end
