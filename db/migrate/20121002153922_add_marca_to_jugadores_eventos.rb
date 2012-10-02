class AddMarcaToJugadoresEventos < ActiveRecord::Migration
  def change
    add_column :jugadores_eventos, :marca, :float
  end
end
