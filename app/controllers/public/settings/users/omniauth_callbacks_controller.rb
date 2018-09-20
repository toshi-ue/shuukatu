# frozen_string_literal: true

class Public::Settings::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_from :facebook
  end

  def google
    callback_from :google_oauth2
  end

  # def google
  #   callback_from :google
  # end

  private
  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:success] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to new_user_registration_url
    end
  end
end
