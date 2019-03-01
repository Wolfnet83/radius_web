class LoginsController < ApplicationController
  def index
    @logins = Login.all
  end
end
