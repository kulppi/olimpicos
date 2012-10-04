class CambiarnombreTiporecodrFromTipoRecords < ActiveRecord::Migration
  def up

    remove_column :tipo_records, :tipoRecodr
    add_column :tipo_records, :tipo_record, :string
    
  end

  def down

    add_column :tipo_records, :tipoRecodr
    remove_column :tipo_records, :tipo_record, :string

  end
end
