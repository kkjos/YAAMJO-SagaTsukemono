class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_cart_item, except: %i[index show complete]
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    # 使用している会員のカートアイテム情報を受け取る
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.payment_method = params[:order][:payment_method]
    # 送料に値を渡す（送料変更の場合ここを変更）
    @order.shipping_cost = 800
    if params[:order][:address_option] == '0'
      # 　使用している会員の住所を受け取る
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      session[:order] = @order
      redirect_to confirm_view_orders_path
    elsif params[:order][:address_option] == '1'
      # 　使用している会員のお届け先情報を受け取る
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      session[:order] = @order
      redirect_to confirm_view_orders_path
    elsif params[:order][:address_option] == '2'
      # 入力された情報を受け取る
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      # お届け先を作成
      @address = Address.new(customer_id: current_customer.id, postal_code: @order.postal_code, address: @order.address,
                     name: @order.name)
      if @address.save
         session[:order] = @order
        redirect_to confirm_view_orders_path
      else
        render :new
      end
    end
  end

  def confirm_view
    @cart_items = CartItem.where(customer_id: current_customer.id)
    # confirmで格納したものを受け取る
    @order = Order.new(session[:order])
  end

  def create
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      # カートアイテムの情報から注文詳細を作成
      @cart_items.each do |cart_item|
        OrderDetail.create!(order_id: @order.id, item_id: cart_item.item_id, amount: cart_item.amount,
                           price: cart_item.with_tax_price)
      end
      # 完了したのちカートアイテム情報を全て削除
      current_customer.cart_items.destroy_all
      redirect_to complete_orders_path
    end


  end

  def index
    @orders = Order.where(customer_id: current_customer.id).page(params[:page]).order(id: 'DESC')
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def complete; end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment,
                                  :remark)
  end

  def ensure_cart_item
    # もしカートアイテム情報がなければ
    redirect_to items_path if current_customer.cart_items.blank?
  end
end
