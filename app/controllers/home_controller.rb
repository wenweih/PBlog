class HomeController < ApplicationController
  def index
    Mypage::AppLogger.info "xxxx"
  end
end
