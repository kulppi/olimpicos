class CreateTipoMedallas < ActiveRecord::Migration
  def change
    create_table :tipo_medallas do |t|
      t.string :tipo_medalla

      t.timestamps
    end
  end
end
