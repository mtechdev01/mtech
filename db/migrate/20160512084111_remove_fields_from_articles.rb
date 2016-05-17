class RemoveFieldsFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :likes_count, :integer
    remove_column :articles, :comments_count, :integer
  end
end
