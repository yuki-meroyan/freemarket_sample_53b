class CategoriesController < ApplicationController

  def index
    ajax_category_action unless params[:keyword].blank?
    respond_to do |format|
      format.json
    end
  end

  def ajax_category_action
    if params[:keyword] == "child"
      @childs = Category.where(ancestry: params[:target_id])
      # binding.pry
    else
    end
    # binding.pry
  end

end
