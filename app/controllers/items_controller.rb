class ItemsController < ApplicationController
  before_action :set_item, only: [:myitem, :show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index,:show]
  before_action :user_id_check, only: [:myitem, :destroy, :edit, :update]

  require 'ancestry'

  def index
    # 配列の用意
    @all_ladys_items = []
    #レディースカテゴリーの指定
    @ladys=Category.find(1)
    # レディースカテゴリーの子孫のカテゴリーを全て取得
    @ladys_grandchiildren = @ladys.subtree
    #子孫カテゴリーに該当するアイテムを全て変数に入れる
    @ladys_grandchiildren.each do |lady|
      @one_ladys_categoy_items = Item.where(category_id: lady.id)
      @all_ladys_items << @one_ladys_categoy_items
    end
    #多次元配列を一次元にする
    @all_ladys_items.flatten!
    # 取り出した商品を更新日が新しい順に
    @all_ladys_items.sort_by!{|item|item.updated_at}.reverse!
    # 配列の最初から10個のみ表示
    @ladys_items= @all_ladys_items.first(10)

    # メンズ
    @all_mens_items = []
    @mens=Category.find(2)
    @mens_grandchiildren = @mens.subtree
    @mens_grandchiildren.each do |men|
      @one_mens_categoy_items = Item.where(category_id: men.id)
      @all_mens_items << @one_mens_categoy_items
    end
    @all_mens_items.flatten!
    @all_mens_items.sort_by!{|item|item.updated_at}.reverse!
    @mens_items= @all_mens_items.first(10)


    # 家電
    @all_electronics_items = []
    @electronics=Category.find(8)
    @electronics_grandchiildren = @electronics.subtree
    @electronics_grandchiildren.each do |lady|
      @one_electronics_categoy_items = Item.where(category_id: lady.id)
      @all_electronics_items << @one_electronics_categoy_items
    end
    @all_electronics_items.flatten!
    @all_electronics_items.sort_by!{|item|item.updated_at}.reverse!
    @electronics_items= @all_electronics_items.first(10)

    # おもちゃ
    @all_toys_items = []
    @toys=Category.find(6)
    @toys_grandchiildren = @toys.subtree
    @toys_grandchiildren.each do |lady|
      @one_toys_categoy_items = Item.where(category_id: lady.id)
      @all_toys_items << @one_toys_categoy_items
    end
    @all_toys_items.flatten!
    @all_toys_items.sort_by!{|item|item.updated_at}.reverse!
    @toys_items= @all_toys_items.first(10)

    @item_image = Item.includes(:image)
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @item = Item.new
    @item.item_images.build
    category_saerch unless params[:keyword].blank?
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      binding.pry
      redirect_to new_item_path
    end
  end

  def edit
    @child_categories = Category.where(ancestry: params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
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
    @items = Item.where('name LIKE(?)', "%#{params[:search]}%").page(params[:page]).per(40)
    @items_count =Item.where('name LIKE(?)', "%#{params[:search]}%").count
    @start_count = ((params.fetch(:page, 1).to_i - 1) * 40)+1
    @end_count = @start_count + 39
    @end_count = @items_count if @end_count > @items_count
    @item_images = ItemImage.includes(:item_id)
  end

  def category_saerch
    if params[:keyword] == "parent"
      @child_categories = Category.where(ancestry: params[:target_id])
      @grandchild_categories =[]
    else params[:keyword] == "child"
      @child_categories=[]
      @child_category   = Category.find(params[:target_id])
      @parent_category  = Category.find(@child_category.ancestry)
      @grandchild_categories =Category.where(ancestry: "#{@parent_category.id}/#{@child_category.id}")
    end
  end


private

  def item_params
    params.require(:item).permit(:name,:description,:price,:region,:delivery_fee,:delivery_days,:shipping_method ,:size,:saved_state,:brand_id,:category_id,item_images_attributes:[:id,:image,:_destroy]).merge(user_id: current_user.id)
  end

end
