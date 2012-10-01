class EquipoEventosController < InheritedResources::Base

	def destroy
		ee = EquipoEventos.find(params[:id])

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = ee.id
    newAuditoria.save
    
		EquipoEventos.delete(ee)
		return render :nothing => true
	end

	def create
		eqev = EquipoEventos.new(params[:equipoEventos])
		@equipo = Equipo.find(eqev.equipo_id)


		respond_to do |format|
      	if eqev.save
          newAuditoria = Auditoria.new
          newAuditoria.tabla = params[:controller]
          newAuditoria.action = params[:action]
          newAuditoria.usuario =  User.all.first.id
          newAuditoria.clave = eqev.id
          newAuditoria.save

    	    format.html { redirect_to @equipo, notice: 'Relacion creada exitosamente' }
        	format.json { render json: @equipo, status: :created, location: @equipo }
     	 else
 	       format.html { render action: "equipo/"+@equipo.id }
  	      format.json { render json: @equipo.errors, status: :unprocessable_entity }
      	end
    	end
	end

end