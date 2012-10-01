class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.integer :deporte_id
      t.string :nombre
      t.text :descripcion
      t.integer :jugadoresPorEquipo
      t.integer :participantes
      t.integer :minutosPorTiempo
      t.integer :cantidadDeTiempos
      t.integer :sector_id

      t.timestamps
    end
  end
end
