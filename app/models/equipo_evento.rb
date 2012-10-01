class EquipoEvento < ActiveRecord::Base
  attr_accessible :equipo_id, :evento_id, :marca

  belongs_to :evento
  belongs_to :equipo 
end
