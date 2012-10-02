class Jugadore < ActiveRecord::Base
  attr_accessible :altura, :apellido, :delegacion_id, :edad, :fecha_nacimiento, :nacionalidad, :nombre, :peso, :tipo_sexo_id, :entrenador_id

  belongs_to :tipo_sexo
  belongs_to :entrenadore, :class_name => "Entrenadore", :foreign_key => "entrenador_id"
  belongs_to :delegacione, :class_name => "delegacione", :foreign_key => "delegacion_id"
  
  has_and_belongs_to_many :equipos


  has_many :disciplinas, :through => :jugadores_disciplinas
  has_many :jugadores_disciplinas

  has_many :eventos, :through => :jugadores_eventos
  has_many :jugadores_eventos

  has_many :medallas
  has_many :registro_records

end
