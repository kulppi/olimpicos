class Entrenadore < ActiveRecord::Base
  attr_accessible :apellido, :delegacion_id, :edad, :fecha_nacimiento, :nacionalidad, :nombre, :tipo_sexo_id
 

  belongs_to :delegacione, :class_name => "delegacione", :foreign_key => "delegacion_id"

  belongs_to :tipo_sexo

  has_many :jugadores

end
