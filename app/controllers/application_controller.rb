class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  def set_locale
    if cookies[:user_locale] && I18n.available_locales.include?(cookies[:user_locale].to_sym)
      l = cookies[:user_locale].to_sym
    else
      l = http_accept_language.compatible_language_from(I18n.available_locales)
      cookies.permanent[:user_locale] = l
    end
    I18n.locale = l || I18n.locale
  end
end
