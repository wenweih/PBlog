class Admin::DashboardController < ApplicationController
  layout "dashboard"
  before_action :logged_in_user
  def index
  end
  private
    def logged_in_user
      redirect_to session[:user_name].nil? ? login_path : admin_path
    end
end
