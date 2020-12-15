class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @orders = Order.page(params[:page])
  end

  def edit
    @order = Order.find(params[:id])
    @add_tax = 1.1
    @order_details = @order.order_details
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
