class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.production_start?
      @order.order_details.each do |order_detail|
      order_detail.production!
      end
    end
    redirect_to request.referer
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
