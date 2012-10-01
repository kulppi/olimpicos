class CreateEquipoEventos < ActiveRecord::Migration
  def change
    create_table :equipo_eventos do |t|
      t.integer :equipo_id
      t.integer :evento_id
      t.float :marca

      t.timestamps
    end
  end
end
