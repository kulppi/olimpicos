class RenameMarcaFromRegistroRecords < ActiveRecord::Migration
  def up

    remove_column :registro_records, :marca
    add_column :registro_records, :marca, :float
  end

  def down
    add_column :registro_records, :marca, :integer
    remove_column :registro_records, :marca, :float
  end
end
