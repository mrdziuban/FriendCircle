class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  has_many :friend_circle_memberships
  accepts_nested_attributes_for :friend_circle_memberships

  validates :password, presence: true, length: {minimum: 4}
  validates :name, presence: true, uniqueness: {scope: :name}
  validates :password_confirmation, presence: true
end
