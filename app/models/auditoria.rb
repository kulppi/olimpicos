class Auditoria < ActiveRecord::Base
  attr_accessible :action, :clave, :fecha, :tabla, :usuario
end
