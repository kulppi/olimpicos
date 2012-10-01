class AddEscalaIdToDisciplinas < ActiveRecord::Migration
  def change
    add_column :disciplinas, :escala_id, :integer
  end
end
