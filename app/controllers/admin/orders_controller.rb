class Admin::OrdersController < ApplicationController
  before_action :authenticate_customer!
  layout 'admins'

  def index
    @orders = Order.all
    @orderAmount = Order.count
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "successfully updated"
      redirect_to edit_admin_order_path(@order)
    else
      render :edit
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
