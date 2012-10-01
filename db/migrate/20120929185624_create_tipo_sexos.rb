class CreateTipoSexos < ActiveRecord::Migration
  def change
    create_table :tipo_sexos do |t|
      t.string :tipo_sexo

      t.timestamps
    end
  end
end
