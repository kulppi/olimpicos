class TipoRecord < ActiveRecord::Base
  attr_accessible :tipo_record

  has_many :registro_records
end
