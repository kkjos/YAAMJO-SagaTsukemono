class Admin::HomesController < ApplicationController
  def top
    @today_orders = Order.where(created_at: Time.zone.today.all_day)
    @today_order_details = OrderDetail.where(created_at: Time.zone.today.all_day)
    @month_orders = Order.where(created_at: Time.zone.today.all_month)
    @month_order_details = OrderDetail.where(created_at: Time.zone.today.all_month)
    @undispatched_orders = Order.where.not(status: 2)
    @waiting_for_deposit_order = Order.where(status: 0)
  end
end