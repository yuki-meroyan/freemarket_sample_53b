class UserDetailsController < ApplicationController
  before_action :check_user_detail  , only: [:new, :create]
  before_action :set_user_detail    , only: [:show, :edit]

  def new
    @user_detail = UserDetail.new
  end

  def create
    @user_detail = UserDetail.new(user_detail_params)
    if @user_detail.save
      alert = "ユーザを登録しました"
      redirect_to sign_up_card_add_path

    # インスタンスの保存に失敗した場合の処理
    else
      alert = "ユーザの登録に失敗しました"
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

  def check_user_detail
    user_detail = UserDetail.find(current_user.id)
    redirect_to sign_up_card_add_path(current_user) if user_detail.present?
  end

end
