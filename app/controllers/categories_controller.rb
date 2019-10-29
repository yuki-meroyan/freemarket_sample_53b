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
    binding.pry
    Item.joins(:categories).where(categories: { id: 1 })
    items = Category.joins(:items).where(categories: { id: 159} )
    items = Category.joins(:items).where(categories: { ancestry: "1/144" } )
    r = Item.includes(:categories).where(id: params[:id])         
    Item.joins(:categories).select("Item.*").where('Category.id: params[id]')
    Category.find(params[:id]).joins(:items).preload(:items)
    category = Category.find(params[:id])
    category = Category.where(ancestry: "1/14")
    category = Category.where(ancestry: "1/14")
    # IN (`取得したtaggingのid`) Item.where("id IN (?)", category)
    # @items = Item.where(category_id: category.id).page(params[:page]).per(40)
    @items = Item.where(category_id: 159).page(params[:page]).per(40)
    @item_images = ItemImage.includes(:item_id)
    
    # TODO: showのビューが完成するまで飛ばないようにしています
    # redirect_to categories_path
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
