class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  validates :password, presence: true, length: {minimum: 4}
  validates :name, presence: true, uniqueness: {scope: :name}
  validates :password_confirmation, presence: true
end
