class LoginStatusController < ApplicationController
  before_action :authorize

  def index
    @login_status = LoginStatus.order(authdate: :desc).page params[:page]
  end
end
