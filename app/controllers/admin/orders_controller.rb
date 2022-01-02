class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  helper_method :sort_column, :sort_direction

  def index
    @orders = Order.all.page(params[:page]).order("#{sort_column} #{sort_direction}")
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

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Order.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end
