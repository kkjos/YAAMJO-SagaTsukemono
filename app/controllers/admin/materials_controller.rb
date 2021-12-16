class Admin::MaterialsController < ApplicationController
  def index
    @material = Material.new
    @materials = Material.all
  end

  def create
    @material = Material.new(material_params)
    @material.save
    flash[:notice] = "原菜を追加しました。"
    redirect_to request.referer
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    @material.update(material_params)
    flash[:notice] = "変更しました。"
    redirect_to admin_materials_path
  end

  private
  def material_params
    params.require(:material).permit(:name)
  end
end
