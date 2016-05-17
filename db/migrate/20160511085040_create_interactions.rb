class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :role
    end
  end
end
