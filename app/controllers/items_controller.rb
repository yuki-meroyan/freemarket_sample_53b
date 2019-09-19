class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
    @user_items = Item.where(user_id: "#{@item.user.id}")
    @brand_items = Item.where(brand_id: "#{@item.brand.id}")
  end
  
end
