class AddColumnsToInteractions < ActiveRecord::Migration
  def change
    add_column :interactions, :user_id, :integer
    add_column :interactions, :project_id, :integer
  end
end
