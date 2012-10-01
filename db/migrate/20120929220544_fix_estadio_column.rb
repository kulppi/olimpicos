class FixEstadioColumn < ActiveRecord::Migration
  def up
  	rename_column :estadios, :olipiada_id, :olimpiada_id
  end

  def down
  end
end
