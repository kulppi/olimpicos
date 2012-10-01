class JugadoresDisciplinas < ActiveRecord::Base
  attr_accessible :disciplina_id, :jugadore_id

  belongs_to :jugadore
  belongs_to :disciplina

end
