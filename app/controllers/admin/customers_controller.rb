class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  helper_method :sort_column, :sort_direction

  def index
    @customers = Customer.all.page(params[:page]).order("#{sort_column} #{sort_direction}")
  end

  def show
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: @customer.id).order(id: 'DESC')
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = '会員情報を編集しました。'
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code,
                                     :address, :telephone_number, :is_deleted)
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end
