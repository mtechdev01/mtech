class AddColumnToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :pdf_file, :string
  end
end
