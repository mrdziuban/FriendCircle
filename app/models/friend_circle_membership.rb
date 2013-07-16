class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :fc_id, :user_id

  belongs_to :user

  validates :user_id, :fc_id, presence: true
end