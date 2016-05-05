class CreateProjects < ActiveRecord::Migration
  def change

    create_table :projects do |t|
      t.timestamps  null: false
      t.belongs_to  :owner, index: true
      t.belongs_to  :category, index: true
      t.boolean     :published, :default => false
      t.datetime    :published_at
      t.string      :name, null: false, default: ""
      t.string      :slug, :null => false
      t.string      :thumb, :null => false
      t.text        :content, null: false, default: ""
      t.string      :state, default: "Proposé"
      t.string      :location, default: "Verdun"
      t.integer     :likes_count, default: "0"
      t.integer     :comments_count, default: "0"
    end

    create_table :projects_followers do |t|
      t.timestamps  null: false
      t.belongs_to  :user, index: true
      t.belongs_to  :project, index: true
    end

    create_table :projects_categories do |t|
      t.string  :name
      t.text    :description
      t.string  :icon
    end

  end
end
