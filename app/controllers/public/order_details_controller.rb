class Public::OrderDetailsController < ApplicationController
  layout 'public'

  def index
    @customer = current_customer
    @orders = @customer.orders.all
  end

  def create
    order = Order.new(order_params)
    if order.save
      flash[:notice] = "successfully added!"
      redirect_to public_order_details_path
    else
      @customer = current_customer
      render :index
    end
  end



  def edit
  end





  private
  def order_params
    params.permit(:postal_code, :address, :name)
  end

end
