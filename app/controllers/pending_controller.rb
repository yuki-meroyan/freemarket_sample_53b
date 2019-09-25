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

  def myitem
    @item = Item.find(1)
  end

end
