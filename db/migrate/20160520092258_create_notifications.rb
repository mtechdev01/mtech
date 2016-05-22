class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :message
      t.integer :notifiable_id
      t.string :notifiable_type
      t.datetime :created_at
      t.boolean :read
    end
  end
end
