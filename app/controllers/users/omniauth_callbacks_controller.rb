class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in @user
      if @user.user_detail.nil?
        redirect_to sign_up_phone_number_path
      else
        redirect_to root_path
      end
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end


  private

  def callback_from(provider)
    provider = provider.to_s
# request.env['omniauth.auth']の中に受け取ったユーザーのデータが入ってる。
    @user = User.find_for_oauth(request.env['omniauth.auth'])
# 成功したらflashを表示してサインインする。
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in @user
      if @user.user_detail.nil?
        redirect_to sign_up_phone_number_path
      else
        redirect_to root_path
      end
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

end