class ItemsController < ApplicationController
  before_action :set_item, only: [:myitem, :show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index,:show]
  before_action :user_id_check, only: [:myitem, :destroy, :edit, :update]

  require 'ancestry'

  def index
    # トップページに表示する商品を入れるための配列
    @all_category_items=[]
    # トップページのカテゴリー
    @top_catgories = Category.where(id: [1,2,6,8])
    @top_catgories.each do |category|
      # 各カテゴリーの商品を入れる配列の用意
      @all_items = []
      # カテゴリーの子孫のカテゴリーを全て取得
      @grandchiildren = category.subtree
      #子孫カテゴリーに該当するアイテムを全て変数に入れる
      @grandchiildren.each do |lady|
        @one_categoy_items = Item.where(category_id: lady.id)
        @all_items << @one_categoy_items
      end
      #[孫][孫]の様な多次元配列を一次元にする
      @all_items.flatten!
      # 取り出した商品を更新日が新しい順に
      @all_items.sort_by!{|item|item.updated_at}.reverse!
      # 配列の最初から10個のみ表示
      @items= @all_items.first(10)
      @all_category_items << @items
    end

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
      render :new
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
