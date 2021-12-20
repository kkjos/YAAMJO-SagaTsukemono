class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def information
    @orders = Order.all
  end

  def report
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @month_orders = Order.where(created_at: @month.all_month)
    @month_order_details = OrderDetail.where(created_at: @month.all_month)
    @year = params[:year] ? Date.parse(params[:year]) : Time.zone.today
    @year_orders = Order.where(created_at: @year.all_year)
    @year_order_details = OrderDetail.where(created_at: @year.all_year)
  end
end