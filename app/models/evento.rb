class Evento < ActiveRecord::Base
  attr_accessible :disciplina_id, :fecha_inicio, :fecha_termino, :sector_id, :serie, :siguienteEvento_id

  belongs_to :evento, :class_name => "evento", :foreign_key => "siguienteEvento_id"
  belongs_to :disciplina
  belongs_to :sectore, :class_name => "sectore", :foreign_key => "sector_id"

  has_and_belongs_to_many :jugadores

  has_many :equipos, :through => :equipo_eventos
  has_many :equipo_eventos

  has_many :registro_records
  has_many :eventos
end
