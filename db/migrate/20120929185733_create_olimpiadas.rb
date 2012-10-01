class CreateOlimpiadas < ActiveRecord::Migration
  def change
    create_table :olimpiadas do |t|
      t.date :ano
      t.text :lugar
      t.date :fecha_inicio
      t.date :fecha_termino

      t.timestamps
    end
  end
end
