class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :token

  has_secure_password

  validates :password, presence: true, length: {minimum: 4}
  validates :name, presence: true, uniqueness: {scope: :name}
end
