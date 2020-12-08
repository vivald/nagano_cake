class Public::AddressesController < ApplicationController
layout 'public'

  def index
    @customer = current_customer
    @addresses = @customer.addresses.all
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      flash[:notice] = "successfully added!"
      redirect_to public_addresses_path
    else
      @customer = current_customer
      render :index
    end
  end



  def edit
    @customer = current_customer
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params
    )
    redirect_to public_addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end





  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
