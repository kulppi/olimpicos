class Deporte < ActiveRecord::Base
  attr_accessible :descripcion, :nombre

  has_many :disciplinas
  has_many :registro_records

end
