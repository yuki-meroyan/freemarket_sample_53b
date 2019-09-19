class ItemsController < ApplicationController

  def index
    @ladys_items = Item.where(category_id: 1)
  end

  def show
  end
  
end
