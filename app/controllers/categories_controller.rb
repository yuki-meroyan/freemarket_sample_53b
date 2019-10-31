class CategoriesController < ApplicationController
  before_action :set_all_items, only: [:index]

  require 'ancestry'

  def index
    ajax_category_action unless params[:keyword].blank?
    respond_to do |format|
      format.json
      format.html
    end
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category.subtree).page(params[:page]).per(12)
  end

  def ajax_category_action
    if params[:keyword] == "parent"
      @parents = Category.where('ancestry is null')
      # binding.pry
    elsif params[:keyword] == "child"
      @childs = Category.where(ancestry: params[:target_id])
      # binding.pry
    elsif params[:keyword] == "grandchild"
      @grandchilds = Category.where(ancestry: params[:target_id])
    end
    # binding.pry
  end

  def set_all_items
    @items = Category.all
    @item_parent = Category.where('ancestry is null')
  end

end
