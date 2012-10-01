class Sectore < ActiveRecord::Base
  attr_accessible :estadio_id, :nombre

  belongs_to :estadio

  has_many :eventos
end
