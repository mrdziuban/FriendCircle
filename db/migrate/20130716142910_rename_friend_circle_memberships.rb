class RenameFriendCircleMemberships < ActiveRecord::Migration
  def change
    rename_table :friend_circle_memberships, :fcms
  end
end
