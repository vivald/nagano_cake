class Admin::HomesController < ApplicationController
  layout 'admin'
  def top
    @customer = current_customer
  end
end
