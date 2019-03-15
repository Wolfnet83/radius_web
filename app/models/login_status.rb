class LoginStatus < ApplicationRecord
  self.table_name = "radpostauth"

  scope :old, -> { where("authdate < ?", 1.day.ago) }

  def given_name
    Login.select(:given_name).where(username: username).first.try(:given_name)
  end
end