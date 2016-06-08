class AddTerritoryAttachmentToUsers < ActiveRecord::Migration
  def change
      add_column :users, :territory_attachment, :string, default: "Domicile"
  end
end
