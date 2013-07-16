class Fc < ActiveRecord::Base
  attr_accessible :name, :user_id, :user_ids

  has_many :fcms
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :users, through: :fcms

  validates :name, :user_id, presence: true
end
