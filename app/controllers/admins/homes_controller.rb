class Admins::HomesController < ApplicationController
  def top
    @customer = current_customer
  end
end
