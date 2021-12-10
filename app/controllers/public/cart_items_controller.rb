class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
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
    @cart_item.save
    flash[:notice] = 'カートに商品を追加しました。'
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
