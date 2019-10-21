class UserDetailsController < ApplicationController

  before_action :set_user_detail, only:[:show, :edit]

  def new
    @user_detail = UserDetail.new
  end

  # [TODO]クレカのview未実装、向井さん担当予定
  # def new4
  # end

  def new5
  end

  def create
    @user_detail = UserDetail.new(user_detail_params)
    if @user_detail.save
      redirect_to sign_in4_path

    # インスタンスの保存に失敗した場合の処理
    else
      render :new
    end
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
