class CreateTipoEscalas < ActiveRecord::Migration
  def change
    create_table :tipo_escalas do |t|
      t.string :tipo_escala

      t.timestamps
    end
  end
end
