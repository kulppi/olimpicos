class CreateRegistroRecords < ActiveRecord::Migration
  def change
    create_table :registro_records do |t|
      t.integer :deporte_id
      t.integer :disciplina_id
      t.integer :evento_id
      t.integer :jugador_id
      t.integer :marca

      t.timestamps
    end
  end
end
