class Public::CustomersController < ApplicationController
  layout 'public'
  def show
    @customer = current_customer
    @items = Item.all
  end

  def edit
    @customer = current_customer
  end


  def update
  end

  def confirm
    @customer = current_customer
  end

  def update_leave
    @customer = current_customer
    if @customer.update(leave_params)
      binding.pry
       flash[:notice]= "successfully Updated"
       redirect_to root_path
    else
      render :confirm
    end
  end

  private
  def customer_params
    params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation)
  end

  def leave_params
    params.require(:customer).permit(:is_deleted)
  end
end
