class Admins::EndUsersController < ApplicationController
  def index
    @customers = Customer.all
    @name = "customers.last_name" + "customers.first_name"
  end

  def show
  end

  def edit
  end

  def update
  end
end
