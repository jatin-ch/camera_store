class User < ApplicationRecord
  has_secure_password

  has_one :cart
  validates :email, presence: true, uniqueness: true
end
