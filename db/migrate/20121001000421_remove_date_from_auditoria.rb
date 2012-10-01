class RemoveDateFromAuditoria < ActiveRecord::Migration
  def up
    remove_column :auditoria, :fecha
  end

  def down
    add_column :auditoria, :fecha, :datetime
  end
end
