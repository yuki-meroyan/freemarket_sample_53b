class UserDetailsController < ApplicationController
  
  def index
    @user_details = UserDetail.all
  end
  
  def new
  end

  def create
  end
  
  def edit
    @user_detail = UserDetail.find(params[:id])
  end

  def update
  end


end
