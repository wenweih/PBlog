class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_to root_path, notice:"Sign in successfully" and return
      else
        redirect_to :back, notice: "#{status.failure_message}"
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "sign out successfully"
  end

  def new
    render template: "sessions/new"
  end
end
