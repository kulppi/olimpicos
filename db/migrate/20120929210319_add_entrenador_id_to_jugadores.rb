class AddEntrenadorIdToJugadores < ActiveRecord::Migration
  def change
    add_column :jugadores, :entrenador_id, :integer
  end
end
