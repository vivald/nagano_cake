class Public::DeliveryStatusesController < ApplicationController
  def index
    @customer = current_customer
  end

  def edit
  end
end
