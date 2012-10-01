class CreateEquipos < ActiveRecord::Migration
  def change
    create_table :equipos do |t|
      t.integer :delegacion_id
      t.integer :disciplina_id

      t.timestamps
    end
  end
end
