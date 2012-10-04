class AddTipoEscalaIdToDisciplina < ActiveRecord::Migration
  def change
    add_column :disciplinas, :tipo_escala_id, :integer
  end
end
