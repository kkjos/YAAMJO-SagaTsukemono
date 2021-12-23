class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    # 販売ステータス、更新順に並び替え
    @items = Item.all.page(params[:page]).order(is_active: 'DESC').order(updated_at: 'DESC')
    @materials = Material.all
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
    @items = Item.where(material_id: @material.id).page(params[:page]).order(updated_at: 'DESC')
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :capacity, :price, :is_active, :material_id)
  end
end
