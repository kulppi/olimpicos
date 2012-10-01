class JugadoresEquiposController < ApplicationController

	def delete
		je = JugadoresEquipos.where('equipo_id = ? AND jugadore_id = ? ', params[:equipos], params[:jugadores]).first
		JugadoresEquipos.delete(je)
		@equipo = Equipo.find(params[:equipos])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = jeq.id
    newAuditoria.save
		redirect_to @equipo

	end

	def new 
		jeq = JugadoresEquipos.new()

		jeq.equipo_id = params[:equipos]
		jeq.jugadore_id = params[:jugadores]
		@equipo = Equipo.find(params[:equipos])
		jeq.save
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = jeq.id
    newAuditoria.save
		redirect_to @equipo

	end

end