class RegistroRecord < ActiveRecord::Base
  attr_accessible :deporte_id, :disciplina_id, :evento_id, :jugador_id, :marca
  
  belongs_to :deporte
  belongs_to :disciplina
  belongs_to :evento
  belongs_to :jugadore, :class_name => "jugadore", :foreign_key => "jugador_id"

end
