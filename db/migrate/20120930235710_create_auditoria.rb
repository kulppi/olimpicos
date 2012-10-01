class CreateAuditoria < ActiveRecord::Migration
  def change
    create_table :auditoria do |t|
      t.string :tabla
      t.datetime :fecha
      t.integer :usuario
      t.string :action
      t.integer :clave

      t.timestamps
    end
  end
end
