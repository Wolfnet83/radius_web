class Login < ApplicationRecord
  self.table_name = "radcheck"
  validates :username, :given_name, :description, presence: true
  validates :username, format: { with: /\A([0-9a-fA-F]{2}[:]){5}[0-9a-fA-F]{2}\z/, 
                                message: "format is invalid" }
end
