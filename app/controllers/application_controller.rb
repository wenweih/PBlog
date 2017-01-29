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

  def authenticate_admin
    signed_in? ? (admin_users_path) : (redirect_to root_path)
  end

  rescue_from ActiveRecord::RecordInvalid do |err|
    render_404
    # render json: { error: 'RecordInvalid', message: "#{err}" }, status: 400
  end
  def render_404
    render_optional_error_file(404)
  end

  def render_403
    render_optional_error_file(403)
  end

  def render_optional_error_file(status_code)
    status = status_code.to_s
    fname = %w(404 403 422 500).include?(status) ? status : 'unknown'
    render template: "/#{fname}", format: [:html],
           status: status, layout: 'application'
  end
end
