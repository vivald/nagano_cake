# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_customer, only: [:create]
  layout 'public'
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    public_customers_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false)
        flash[:notice] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    else
      flash[:notice] = "必須項目を入力してください。"
    end
  end

  # if (@customer.valid_password?(params[:customer][:password])で、入力されたパスワードが正しいことを確認
  # (@customer.active_for_authentication? == false))で、@customerのactive_for_authentication?メソッドがfalseであるかどうかを確認
end
