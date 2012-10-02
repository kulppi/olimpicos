class CambiosMejora < ActiveRecord::Migration
  def up
    remove_column :disciplinas, :escala_id
    add_column :disciplinas, :escala_id, :integer
  end

  def down
  end
end
