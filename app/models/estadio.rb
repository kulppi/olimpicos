class Estadio < ActiveRecord::Base
  attr_accessible :cordx, :cordy, :direccion, :nombre, :olipiada_id

  belongs_to :olimpiada
  has_many :sectores
end
