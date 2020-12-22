class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :null_session

  # サインイン後の挙動はprotected の上に書く
  # 引数はresource

  # protect_from_forgery with: :exception
  # helper_method :current_cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  def after_sign_out_path_for(resource)
    '/' # サインアウト後のリダイレクト先URL
  end
end
