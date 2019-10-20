class PendingController < ApplicationController

  def index
  end

  def itembuy
  end

  def logout
  end

  def edit
    
  end

  
  def item_edit
    @child_category   = Category.find(params[:keyword])
    @parent_category  = Category.find(@child_category.ancestry)
    @grandchild_categories =Category.where(ancestry: "#{@parent_category.id}/#{@child_category.id}")
    respond_to do |format|
      format.html
      format.json
    end
  end

end
