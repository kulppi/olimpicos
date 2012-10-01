class AddEquipoidToRegistroRecords < ActiveRecord::Migration
  def change
    add_column :registro_records, :equipo_id, :integer
  end
end
