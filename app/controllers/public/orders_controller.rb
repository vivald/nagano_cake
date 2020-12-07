class Public::OrdersController < ApplicationController
  layout 'public'

  def new
    @customer = current_customer
    @order = current_customer.orders
  end

  def complete
  end

  def index
    @customer = current_customer
  end

  def show
  end

end
