class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.all.page(params[:page]).order(created_at: 'DESC')
  end

  def show
  end
end
