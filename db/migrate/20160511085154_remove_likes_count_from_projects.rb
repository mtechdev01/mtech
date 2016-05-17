class RemoveLikesCountFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :likes_count, :integer
  end
end
