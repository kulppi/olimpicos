class CreateJugadoresDisciplinas < ActiveRecord::Migration
  def change
    create_table :jugadores_disciplinas do |t|
      t.integer :jugadore_id
      t.integer :disciplina_id

      t.timestamps
    end
  end
end
