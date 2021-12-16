class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order_detail.order.id)
    @order_detail.update(order_detail_params)
    if @order_detail.production?
      @order_detail.order.production_start!
    elsif @order_details.count == @order_details.production_completed.count
      @order_detail.order.ready_to_ship!
    end
    redirect_to request.referer
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
