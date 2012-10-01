class AuditoriaController < ApplicationController

  def index
  	@auts = Auditoria.all
  end

end
