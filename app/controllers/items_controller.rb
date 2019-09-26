class ItemsController < ApplicationController

  def index
    @ladys_items = Item.where(category_id: 1)
  end

  def show
    @item = Item.find(params[:id])
    @user_items = Item.where(user_id: "#{@item.user.id}")
    @brand_items = Item.where(brand_id: "#{@item.brand.id}")
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy  if item.user_id == current_user.id
    if item.destroy
      redirect_to root_path
    else
      render myitem
    end 
  end

  def myitem
    @item = Item.find(params[:id])
  end


end
