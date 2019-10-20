class CategoriesController < ApplicationController

  def index
    ajax_category_action unless params[:keyword].blank?
    respond_to do |format|
      format.json
    end
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

end
