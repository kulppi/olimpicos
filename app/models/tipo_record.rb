class TipoRecord < ActiveRecord::Base
  attr_accessible :tipoRecodr

  has_many :registro_records
end
