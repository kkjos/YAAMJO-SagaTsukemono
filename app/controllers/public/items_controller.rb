class Public::ItemsController < ApplicationController
  def index
    # 販売ステータス、更新順に並び替え
    @items = Item.all.page(params[:page]).order(is_active: "DESC").order(updated_at: "DESC")
    @materials = Material.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def search
    @materials = Material.all
    @material = Material.find(params[:id])
    @items = Item.where(material_id: @material.id).page(params[:page]).order(updated_at: "DESC")
  end
end
