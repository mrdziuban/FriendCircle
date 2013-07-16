class Post < ActiveRecord::Base
  attr_accessible :body, :user_id, :fc_ids, :links_attributes

  belongs_to :user
  has_many :fcs, through: :post_shares
  has_many :post_shares
  has_many :links
  accepts_nested_attributes_for :links, reject_if: :all_blank

  validates :body, presence: true
end
