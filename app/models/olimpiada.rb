class Olimpiada < ActiveRecord::Base
  attr_accessible :ano, :fecha_inicio, :fecha_termino, :lugar

  has_many :delegaciones
  has_many :estadios
end
