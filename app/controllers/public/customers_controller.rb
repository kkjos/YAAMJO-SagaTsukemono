class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    # 使用している会員情報のみ受け取る
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
      flash[:notice] = 'マイページを更新しました。'
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    # もし退会するに更新したなら
    sign_out current_customer if @customer.update(is_deleted: true)
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code,
                                     :address, :telephone_number, :is_deleted)
  end
end
