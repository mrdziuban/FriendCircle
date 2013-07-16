class PostShare < ActiveRecord::Base
  attr_accessible :fc_id, :post_id

  belongs_to :fc
  belongs_to :post
end
