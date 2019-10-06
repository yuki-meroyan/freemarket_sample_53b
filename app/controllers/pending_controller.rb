class PendingController < ApplicationController

  def index 
  end

  def itembuy
  end

  def logout
  end

  def edit
  end

  def member_complate
  end

  def search
    @items = Item.where('title LIKE(?)', "%#{params[:keyword]}%")
  end
  
end
