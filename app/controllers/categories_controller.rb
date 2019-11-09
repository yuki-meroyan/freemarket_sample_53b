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
    @position = params[:position]
    @items = Item.where(category_id: @category.subtree).page(params[:page]).per(12)
  end

  def ajax_category_action
    @categories = Category.all
  end

  def set_all_items
    @items = Category.all
    @item_parent = Category.where('ancestry is null')
  end

end
