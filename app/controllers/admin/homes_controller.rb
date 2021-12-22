class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all
    # 注文全てから本日、30日間の情報を受け取る
    @today_orders = @orders.where(created_at: Time.zone.today.all_day)
    @for30day_orders = @orders.where(created_at: Time.zone.today.ago(30.days)..Time.zone.today.end_of_day)
    @order_details = OrderDetail.all
    # 注文履歴全てから本日、30日間の情報を受け取る
    @today_order_details = @order_details.where(created_at: Time.zone.today.all_day)
    @for30day_order_details = @order_details.where(created_at: Time.zone.today.ago(30.days)..Time.zone.today.end_of_day)
  end

  def information
    @orders = Order.all
  end

  def report
    # データがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    # 取得した時刻が含まれる月や年の範囲の情報を受け取る
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @month_orders = Order.where(created_at: @month.all_month)
    @month_order_details = OrderDetail.where(created_at: @month.all_month)
    @year = params[:year] ? Date.parse(params[:year]) : Time.zone.today
    @year_orders = Order.where(created_at: @year.all_year)
    @year_order_details = OrderDetail.where(created_at: @year.all_year)
  end
end
