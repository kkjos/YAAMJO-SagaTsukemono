class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:notice] = '商品の数量を変更しました。'
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    redirect_to request.referer
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path, notice: "商品の数量が変更されました"
    else
      @cart_item.save
      flash[:notice] = 'カートに商品を追加しました。'
      redirect_to cart_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
