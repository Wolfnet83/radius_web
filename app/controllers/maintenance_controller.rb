class MaintenanceController < ApplicationController

  def clear_db
    sql = "DELETE FROM radacct"
    ActiveRecord::Base.connection.execute(sql)
    LoginStatus.old.delete_all

    redirect_back(fallback_location: logins_path)
  end

end