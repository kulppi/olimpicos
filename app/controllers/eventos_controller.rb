class EventosController < ApplicationController
  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventos }
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    @evento = Evento.find(params[:id])
    @disciplina = Disciplina.find(@evento.disciplina_id)


    if @disciplina.jugadoresPorEquipo == 1
      query = Jugadore.joins(' JOIN jugadores_eventos ON jugadores_eventos.jugadore_id = jugadores.id').where('jugadores_eventos.evento_id = ?' , @evento.id )
      @jugadoresIn = query.all
      @jugadores = Jugadore.joins(' JOIN jugadores_disciplinas ON jugadores_disciplinas.jugadore_id = jugadores.id').where('jugadores.id NOT IN (?) AND jugadores_disciplinas.disciplina_id = ?' , query.select('Jugadores.id').empty? ? [0] : query.select('Jugadores.id').all , @evento.disciplina_id ).all

    else
      query = Equipo.joins('LEFT OUTER  JOIN equipo_eventos ON equipo_eventos.equipo_id = equipos.id').where('equipo_eventos.evento_id = ?' , @evento.id )
      @jugadoresIn = query.all
      @jugadores = Equipo.where('id NOT IN (?) AND disciplina_id = ?' , query.select('equipos.id').empty? ? [0] : query.select('equipos.id').all , @evento.disciplina_id ).all
     
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/new
  # GET /eventos/new.json
  def new
    @evento = Evento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/1/edit
  def edit
    @evento = Evento.find(params[:id])
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(params[:evento])


    respond_to do |format|
      if @evento.save

        
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @evento.id
    newAuditoria.save




        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render json: @evento, status: :created, location: @evento }
      else
        format.html { render action: "new" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventos/1
  # PUT /eventos/1.json
  def update
    @evento = Evento.find(params[:id])

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @evento.id
    newAuditoria.save

    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento = Evento.find(params[:id])

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @evento.id
    newAuditoria.save


    EquipoEvento.where('equipo_eventos.evento_id = ?', @evento.id).each do |y|

      y.destroy
    end
    JugadoresEventos.where('jugadores_eventos.evento_id = ?', @evento.id).each do |y|

      y.destroy
    end

    @evento.delete


    respond_to do |format|
      format.html { redirect_to eventos_url }
      format.json { head :no_content }
    end
  end

  def add
    @evento = Evento.find(params[:id])
    disciplina = Disciplina.find(@evento.disciplina_id)

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @evento.id
    newAuditoria.save

    if disciplina.jugadoresPorEquipo == 1
      je = JugadoresEventos.new
      je.jugadore_id = params[:player]
    else
      je = EquipoEvento.new
      je.equipo_id = params[:player]
    end
      je.evento_id = params[:id]
      je.save


      redirect_to @evento
  
  end

  def remover
    @evento = Evento.find(params[:id])

    disciplina = Disciplina.find(@evento.disciplina_id)

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @evento.id
    newAuditoria.save

    if disciplina.jugadoresPorEquipo == 1
      je = JugadoresEventos.where('jugadore_id = ? AND evento_id = ? ', params[:player], params[:id]).first
    else
      je = EquipoEvento.where('equipo_id = ? AND evento_id = ? ', params[:player], params[:id]).first
    end
    je.destroy

      redirect_to @evento

  
  end

  def score
    @evento = Evento.find(params[:evento])
    disciplina = Disciplina.find(@evento.disciplina_id)
    
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @evento.id
    newAuditoria.save

rr = RegistroRecord.where("deporte_id = ? AND disciplina_id = ?", disciplina.deporte_id, disciplina.id).first_or_create( :evento_id => @evento.id, :marca => (disciplina.tipo_escala_id == TipoEscala.where('tipo_escala = ?','Asc').first.id ? 0.0 : 99999.99) )
      
    if disciplina.jugadoresPorEquipo == 1
      je = JugadoresEventos.find(params[:id])
      je.marca = params[:marca]
      rr.jugador_id = je.jugadore_id
      
    else
      je = EquipoEvento.find(params[:id])
      je.marca = params[:marca]
      rr.equipo_id = je.equipo_id
    end
    je.marca = params[:marca]
    je.save


        rr.save
##actualizar registros
      if rr.marca.nil? 
        rr.marca = je.marca
        rr.evento = @evento.id
        rr.save
      end


      redirect_to @evento

  
  end


end
