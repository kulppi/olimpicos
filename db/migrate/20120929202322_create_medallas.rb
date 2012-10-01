class CreateMedallas < ActiveRecord::Migration
  def change
    create_table :medallas do |t|
      t.integer :tipo_medalla_id
      t.integer :disciplina_id
      t.integer :jugador_id

      t.timestamps
    end
  end
end
