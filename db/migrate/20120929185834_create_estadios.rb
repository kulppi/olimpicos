class CreateEstadios < ActiveRecord::Migration
  def change
    create_table :estadios do |t|
      t.string :nombre
      t.string :direccion
      t.integer :cordx
      t.integer :cordy
      t.integer :olipiada_id

      t.timestamps
    end
  end
end
