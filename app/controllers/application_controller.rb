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

end
