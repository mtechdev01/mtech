class AddLabelizedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :labelized, :boolean, :default => false
  end
end
