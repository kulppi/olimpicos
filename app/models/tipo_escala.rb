class TipoEscala < ActiveRecord::Base
  attr_accessible :tipo_escala

  has_many :disciplinas
end
