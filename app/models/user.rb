class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  has_many :fcms
  accepts_nested_attributes_for :fcms
  has_many :fcs
  has_many :participating_fcs, through: :fcms, source: :fcs
  has_many :posts


  validates :password, presence: true, length: {minimum: 4}, on: :create
  validates :name, presence: true, uniqueness: {scope: :name}
  validates :password_confirmation, presence: true, on: :create
end
