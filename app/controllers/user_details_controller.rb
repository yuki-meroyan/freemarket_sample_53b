class UserDetailsController < ApplicationController
  before_action :set_user_detail, only:[:show, :edit]
  def show

  end
  
  def edit
  end

  def update
  end

  def set_user_detail
    @user_detail = UserDetail.find(current_user.id)
  end

end
