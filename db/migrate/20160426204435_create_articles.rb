class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.timestamps  null: false
      t.string      :title, :null => false
      t.string      :slug, :null => false
      t.string      :thumb
      t.text        :content, :null => false
      t.datetime    :published_at
      t.belongs_to  :category, index: true, :null => false
      t.belongs_to  :author, index: true, :null => false
      t.boolean     :published, :default => false
      t.integer     :likes_count, default: "0"
      t.integer     :comments_count, default: "0"
    end
  end
end
