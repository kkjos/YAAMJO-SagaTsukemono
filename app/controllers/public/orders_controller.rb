class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 800

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    if @order.postal_code.blank? || @order.address.blank? || @order.name.blank?
      render :new
    else
      session[:order] = @order
      redirect_to confirm_view_orders_path
    end
  end

  def confirm_view
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(session[:order])
  end

  def create
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      Address.create(customer_id: @order.customer_id, name: @order.name, postal_code: @order.postal_code, address: @order.address)
      @cart_items.each do |cart_item|
      OrderDetail.create(order_id: @order.id, item_id: cart_item.item_id, amount: cart_item.amount, price: cart_item.with_tax_price)
      end
      current_customer.cart_items.destroy_all
      redirect_to complete_orders_path
    end
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment)
  end
  
end
