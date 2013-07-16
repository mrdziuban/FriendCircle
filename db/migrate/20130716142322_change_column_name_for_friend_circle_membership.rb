class ChangeColumnNameForFriendCircleMembership < ActiveRecord::Migration
  def change
    rename_column :friend_circle_memberships, :friend_id, :fc_id
  end
end
