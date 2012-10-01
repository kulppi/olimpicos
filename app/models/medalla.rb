class Medalla < ActiveRecord::Base
  attr_accessible :disciplina_id, :jugador_id, :tipo_medalla_id
  
  belongs_to :jugadore,  :class_name => "jugadore", :foreign_key => "jugador_id"
  belongs_to :tipo_medalla 
  belongs_to :disciplina
end
