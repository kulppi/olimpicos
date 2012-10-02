class JugadoresEventos < ActiveRecord::Base
  attr_accessible :evento_id, :jugadore_id

  belongs_to :jugadores
  belongs_to :eventos
end
