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
    @customer = current_customer
    if @customer.update(update_params)
      flash[:notice] = "編集に成功しました"
      redirect_to public_customers_path
    else
      render :edit
    end
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
  def update_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end

  def leave_params
    params.require(:customer).permit(:is_deleted)
  end
end
