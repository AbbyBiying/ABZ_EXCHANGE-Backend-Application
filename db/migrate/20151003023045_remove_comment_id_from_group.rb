class RemoveCommentIdFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :comment_id, :integer
  end
end
