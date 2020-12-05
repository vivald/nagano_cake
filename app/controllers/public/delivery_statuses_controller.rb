class Public::DeliveryStatusesController < ApplicationController
  layout 'public'
  
  def index
    @customer = current_customer
  end

  def edit
  end
end
