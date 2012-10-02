class AddMarcaToJugadoresEventos < ActiveRecord::Migration
  def change
    rename_column :jugadores_eventos, :marca, :float
    rename_column :equipo_evento, :marca, :float
  end
end
