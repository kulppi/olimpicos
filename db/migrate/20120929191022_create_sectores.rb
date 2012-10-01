class CreateSectores < ActiveRecord::Migration
  def change
    create_table :sectores do |t|
      t.string :nombre
      t.integer :estadio_id

      t.timestamps
    end
  end
end
