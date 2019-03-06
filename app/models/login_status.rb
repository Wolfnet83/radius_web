class LoginStatus < ApplicationRecord
  self.table_name = "radpostauth"

  def given_name
    Login.select(:given_name).where(username: username).first.try(:given_name)
  end
end