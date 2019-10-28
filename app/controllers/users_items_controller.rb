class UsersItemsController < ApplicationController

  def index
    @user =  User.find(params[:user_id])
    unless @user.id == current_user.id
      flash[:notice] = "ユーザーが違います"
      redirect_to root_path
    end
  end

  def show
    set_item
    user_id_check
  end
end
