class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to  :user, dependent: :destroy, counter_cache: true
      t.references  :likeable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
