class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.integer :disciplina_id
      t.date :fecha_inicio
      t.date :fecha_termino
      t.integer :sector_id
      t.integer :serie
      t.integer :siguienteEvento_id

      t.timestamps
    end
  end
end
