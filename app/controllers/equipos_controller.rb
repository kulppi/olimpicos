class EquiposController < ApplicationController
  # GET /equipos
  # GET /equipos.json
  def index
    @equipos = Equipo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @equipos }
    end
  end

  # GET /equipos/1
  # GET /equipos/1.json
  def show
    @equipo = Equipo.find(params[:id])
 
   

    query = Jugadore.joins(' JOIN jugadores_equipos ON jugadores_equipos.jugadore_id = jugadores.id').where('jugadores_equipos.equipo_id = ?' , @equipo.id )
    @jugadoresIn = query.all
    @jugadores = Jugadore.where('id NOT IN (?) AND jugadores.delegacion_id = ?' , query.select('Jugadores.id').empty? ? [0] : query.select('Jugadores.id').all , @equipo.delegacion_id ).all
 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equipo }
    end
  end

  # GET /equipos/new
  # GET /equipos/new.json
  def new
    @equipo = Equipo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @equipo }
    end
  end

  # GET /equipos/1/edit
  def edit
    @equipo = Equipo.find(params[:id])
  end

  # POST /equipos
  # POST /equipos.json
  def create
    @equipo = Equipo.new(params[:equipo])

    respond_to do |format|
      if @equipo.save
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @equipo.id
    newAuditoria.save
        format.html { redirect_to @equipo, notice: 'Equipo was successfully created.' }
        format.json { render json: @equipo, status: :created, location: @equipo }
      else
        format.html { render action: "new" }
        format.json { render json: @equipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /equipos/1
  # PUT /equipos/1.json
  def update
    @equipo = Equipo.find(params[:id])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @equipo.id
    newAuditoria.save

    respond_to do |format|
      if @equipo.update_attributes(params[:equipo])
        format.html { redirect_to @equipo, notice: 'Equipo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipos/1
  # DELETE /equipos/1.json
  def destroy
    @equipo = Equipo.find(params[:id])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @equipo.id
    newAuditoria.save

    EquipoEvento.where('equipo_eventos.equipo_id = ?', @equipo.id).each do |y|

      y.destroy
    end

    JugadoresEquipo.where('jugadores_equipos.equipo_id = ?', @equipo.id).each do |y|

      y.destroy
    end

    @equipo.delete

    respond_to do |format|
      format.html { redirect_to equipos_url }
      format.json { head :no_content }
    end
  end
end
