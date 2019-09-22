class ItemsController < ApplicationController

  def index
    @ladys_items = Item.where(category_id: 1)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @user_items = Item.where(user_id: "#{@item.user.id}")
    @brand_items = Item.where(brand_id: "#{@item.brand.id}")
  end
  
end
