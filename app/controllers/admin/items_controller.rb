class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  helper_method :sort_column, :sort_direction

  def index
    @items = Item.all.page(params[:page]).order("#{sort_column} #{sort_direction}")
    @materials = Material.all
    @items_rank = Item.find(OrderDetail.group(:item_id).order(amount: :desc).limit(10).pluck(:item_id))
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = '商品を追加しました。'
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = '商品を編集しました。'
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  def search
    @materials = Material.all
    @material = Material.find(params[:id])
    @items = Item.where(material_id: @material.id).page(params[:page]).order("#{sort_column} #{sort_direction}")
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :capacity, :price, :is_active, :material_id)
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end
