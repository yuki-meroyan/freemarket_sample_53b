class UserDetailsController < ApplicationController
  
  def show
    @user_detail = UserDetail.find(params[:id])
  end
  
  def edit
    @user_detail = UserDetail.find(params[:id])
  end

  def update
  end


end
