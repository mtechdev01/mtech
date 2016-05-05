class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string      :content
      t.belongs_to  :user, dependent: :destroy, counter_cache: true
      t.references  :commentable, polymorphic: true, index: true
      t.integer     :likes_count, default: "0"
      t.boolean     :is_valid, default: false
      t.timestamps null: false
    end
  end
end
