class RemoveCommentsCountFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :comments_count, :integer
  end
end
