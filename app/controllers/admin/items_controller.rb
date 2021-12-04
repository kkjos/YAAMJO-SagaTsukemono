class Admin::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end
end
