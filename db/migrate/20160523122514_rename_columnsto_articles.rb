class RenameColumnstoArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :author_id, :owner_id
    rename_column :articles, :title, :name
  end
end
