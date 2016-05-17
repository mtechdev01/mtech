class RemoveLikesCountFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :likes_count, :integer
  end
end
