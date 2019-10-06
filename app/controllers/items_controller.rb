class ItemsController < ApplicationController
  before_action :set_item, only: [:myitem, :show, :destroy]

  def index
    @ladys_items = Item.where(category_id: 1).order('id ASC').limit(10)
  end

  def new
  end

  def show
    @user_items = Item.where(user_id: "#{@item.user.id}").order('id ASC').limit(6).where.not(id: @item.id)
    @brand_items = Item.where(brand_id: "#{@item.brand.id}").order('id ASC').limit(6).where.not(id: @item.id)
  end

  def destroy
    @item.destroy  if @item.user_id == current_user.id
    if @item.destroy
      redirect_to root_path
    else
      render myitem
    end 
  end

  def myitem
  end
  
  def search
    @items = Item.where('title LIKE(?)', "%#{params[:keyword]}%").count
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

end
