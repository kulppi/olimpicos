class CreateTipoRecords < ActiveRecord::Migration
  def change
    create_table :tipo_records do |t|
      t.string :tipoRecodr

      t.timestamps
    end
  end
end
