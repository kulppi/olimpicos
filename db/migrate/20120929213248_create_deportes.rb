class CreateDeportes < ActiveRecord::Migration
  def change
    create_table :deportes do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
