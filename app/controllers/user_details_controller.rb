class UserDetailsController < ApplicationController

  before_action :set_user_detail, only:[:show, :edit]

  def new
    @user_detail = UserDetail.new
  end

  def create
  end


  def show
  end
  
  def edit
  end

  def update
  end

  def set_user_detail
    @user_detail = UserDetail.find(current_user.id)
  end

  private

  def user_detail_params
    params.require(:user_detail).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :postal_code, :prefectures, :cities, :address, :building_name).merge(user_id: current_user.id)
  end

end
