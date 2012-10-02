class Disciplina < ActiveRecord::Base
  attr_accessible :cantidadDeTiempos, :deporte_id, :descripcion, :jugadoresPorEquipo, :minutosPorTiempo, :nombre, :participantes, :sector_id, :tipo_escala_id
  
  belongs_to :deporte
  belongs_to :sectore

  belongs_to :tipo_escala

  has_many :jugadores, :through => :jugadores_disciplinas
  has_many :jugadores_disciplinas

  has_many :equipos
  has_many :jugadores
  has_many :registro_records
  has_many :eventos

end
