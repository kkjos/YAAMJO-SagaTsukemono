class Admin::MaterialsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @material = Material.new
    @materials = Material.all
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      flash[:notice] = '原菜を追加しました。'
      redirect_to request.referer
    else
      @materials = Material.all
      render :index
    end
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      flash[:notice] = '変更しました。'
      redirect_to admin_materials_path
    else
      render :edit
    end
  end

  private

  def material_params
    params.require(:material).permit(:name)
  end
end
