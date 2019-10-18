class CategoriesController < ApplicationController

  def index
    ajax_category_action unless params[:keyword].blank?
  end

  def ajax_category_action
    # binding.pry
    if params[:type] == "child"
      @childs = Category.where(ancestry: params[:keyword])
    else
    end
  end

end
