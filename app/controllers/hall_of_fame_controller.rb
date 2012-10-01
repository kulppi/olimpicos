class HallOfFameController < ApplicationController


  def index

  	@jugadores = HallOfFame.all
  end

end
