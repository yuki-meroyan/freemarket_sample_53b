class ItemsController < ApplicationController
  before_action :set_item, only: [:myitem, :show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index,:show]
  before_action :user_id_check, only: [:myitem, :destroy, :edit, :update]

  def index
    @ladys_items = Item.where(category_id: 159).order('created_at DESC').limit(10)
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
    @item.price.to_i
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

private

  def item_params
    params.require(:item).permit(:name,:description,:price,:region,:delivery_fee,:delivery_days,:shipping_method ,:size,:saved_state,:brand_id,:category_id,item_images_attributes:[:id,:image,:_destroy]).merge(user_id: current_user.id)
  end

end
