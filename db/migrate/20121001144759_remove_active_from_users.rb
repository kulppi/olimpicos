class RemoveActiveFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :active
  end

  def down
    add_column :users, :active, :boolean
  end
end
