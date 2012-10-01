class CreateJugadoresEventos < ActiveRecord::Migration
  def change
    create_table :jugadores_eventos do |t|
      t.integer :jugadore_id
      t.integer :evento_id

      t.timestamps
    end
  end
end
