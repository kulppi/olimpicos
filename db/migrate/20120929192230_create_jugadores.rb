class CreateJugadores < ActiveRecord::Migration
  def change
    create_table :jugadores do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nacimiento
      t.float :peso
      t.float :altura
      t.integer :edad
      t.integer :tipo_sexo_id
      t.string :nacionalidad
      t.integer :delegacion_id

      t.timestamps
    end
  end
end
