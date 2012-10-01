class TipoSexo < ActiveRecord::Base
  attr_accessible :tipo_sexo

  has_many :entrenadores
  has_many :jugadores
end
