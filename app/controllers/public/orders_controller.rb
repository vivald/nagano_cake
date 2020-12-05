class Public::OrdersController < ApplicationController
  layout 'public'
  
  def new
  end

  def complete
  end

  def index
    @customer = current_customer
  end

  def show
  end
end
