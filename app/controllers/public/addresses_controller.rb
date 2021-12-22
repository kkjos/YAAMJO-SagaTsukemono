class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    # 使用している会員Idで特定のお届け先のみ受け取る
    @addresses = Address.where(customer_id: current_customer.id).page(params[:page])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = 'お届け先を追加しました。'
      redirect_to request.referer
    else
      @addresses = Address.where(customer_id: current_customer.id).page(params[:page])
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = 'お届け先を変更しました。'
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
