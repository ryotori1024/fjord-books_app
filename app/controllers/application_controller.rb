# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時に名前、郵便番号、住所、自己紹介文のストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name postal_code address self_introduction])
    # アカウント編集時に名前、郵便番号、住所、自己紹介文のストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name postal_code address self_introduction])
  end
end
