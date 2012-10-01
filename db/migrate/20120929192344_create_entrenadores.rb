class CreateEntrenadores < ActiveRecord::Migration
  def change
    create_table :entrenadores do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nacimiento
      t.integer :edad
      t.integer :tipo_sexo_id
      t.string :nacionalidad
      t.integer :delegacion_id

      t.timestamps
    end
  end
end
