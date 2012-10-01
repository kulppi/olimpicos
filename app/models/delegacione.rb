class Delegacione < ActiveRecord::Base
  attr_accessible :olimpiada_id, :pais

  belongs_to :olimpiada

  has_many :entrenadores
  has_many :jugadores
  has_many :equipos
end
