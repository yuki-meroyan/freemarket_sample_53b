class ItemsController < ApplicationController
  before_action :set_item, only: [:myitem, :show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index,:show]
  before_action :user_id_check, only: [:myitem, :destroy, :edit, :update]

  def index
    @ladys_items = Item.where(category_id: 159).order('id ASC').limit(10)
    @item_image = Item.includes(:image)
  end

  def new
  end

  

  def edit
    @child_categories = Category.where(ancestry: params[:keyword])
    @brands = Brand.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    if @item.user_id == current_user.id
      if Brand.find_by(name: params[:brand_id]).present?
        brand =Brand.find_by(name: params[:brand_id])
      else
        Brand.create(name: params[:brand_id])
        brand =Brand.find_by(name: params[:brand_id])
      end
    @item.brand_id ="#{brand.id}"
    end

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

  def create
    item = Item.new(create_params)
    if item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
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
  

private

  def item_params
    params.require(:item).permit(:name,:description,:price,:region,:delivery_fee,:delivery_days,:shipping_method ,:size,:saved_state,:brand_id,:category_id,item_images_attributes:[:id,:image,:_destroy]).merge(user_id: current_user.id)
  end

  def create_params
    anc = Category.find(params[:category_id])
    params.permit(:name, :description, :price, :region, :delivery_fee, :delivery_days, :shipping_method, :brand_id, :category_id, :size, :saved_state).merge(user_id: current_user.id, ancestry: anc.ancestry)
  end

end
