class HomeController < ApplicationController
  def index
  end
  def language
    l = params[:locale].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    cookies.permanent[:user_locale] = l
    if request.env["HTTP_REFERER"].present?
      redirect_to :back
    else
      redirect_to '/'
    end
  end

  def download_pdf
    send_file(
      "#{Rails.root}/public/huangwenwei_CV.pdf",
      filename: "huangwenwei_CV.pdf",
      type: "application/pdf"
    )
  end
end
