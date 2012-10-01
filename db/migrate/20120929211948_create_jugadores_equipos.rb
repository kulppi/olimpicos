class CreateJugadoresEquipos < ActiveRecord::Migration
  def change
    create_table :jugadores_equipos do |t|
      t.integer :jugadore_id
      t.integer :equipo_id

      t.timestamps
    end
  end
end
