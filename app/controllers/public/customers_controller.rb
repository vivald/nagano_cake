class Public::CustomersController < ApplicationController
  layout 'public'
  def show
    @customer = Customer.find(params[:id])
    @goodsAmount = Item.count
    @items = Item.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
  end

  private
  def customer_params
    params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation)
  end
end
