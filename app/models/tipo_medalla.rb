class TipoMedalla < ActiveRecord::Base
  attr_accessible :tipo_medalla

  has_many :medallas
  
end
