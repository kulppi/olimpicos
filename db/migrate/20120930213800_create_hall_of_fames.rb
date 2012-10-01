class CreateHallOfFames < ActiveRecord::Migration
  def change
    create_table :hall_of_fames do |t|
      t.string :nombre
      t.string :pais
      t.integer :numOro

      t.timestamps
    end
  end
end
