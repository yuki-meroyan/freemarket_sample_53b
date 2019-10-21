class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.basic[:auth_user] && password == Rails.application.credentials.basic[:auth_password]
    end
  end

  def checkUserSignedIn
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      flash[:notice] = "ログインしてください"
      redirect_to action: :index
    end
  end

  def user_id_check
    unless @item.user_id == current_user.id
      flash[:notice] = "ユーザーが違います"
      redirect_to action: :index
    end
  end

end
