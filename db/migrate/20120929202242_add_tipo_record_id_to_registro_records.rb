class AddTipoRecordIdToRegistroRecords < ActiveRecord::Migration
  def change
    add_column :registro_records, :tipo_record_id, :integer
  end
end
