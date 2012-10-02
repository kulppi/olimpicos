class Equipo < ActiveRecord::Base
  attr_accessible :delegacion_id, :disciplina_id

  belongs_to :delegacione, :class_name => "delegacione", :foreign_key => "delegacion_id"
  belongs_to :disciplina

  has_and_belongs_to_many :jugadores

  has_many :eventos, :through => :equipo_eventos
  has_many :equipo_eventos

  
end
