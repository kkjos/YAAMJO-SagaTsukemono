# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_inactive_customer, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

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
  def reject_inactive_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    # もし登録されているメールアドレスとパスワードが一致し、退会済みの場合
    if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false)
      redirect_to new_customer_registration_path
      flash[:notice] = '退会済みです。再度ご登録をしてご利用ください。'
    end
  end
end
