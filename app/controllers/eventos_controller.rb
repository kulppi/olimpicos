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

      idOlimp  = TipoRecord.where("tipo_record = ?",'Olimpico').first.id
      idMundial  = TipoRecord.where("tipo_record = ?",'Mundial').first.id

    rr = RegistroRecord.where("deporte_id = ? AND disciplina_id = ? AND tipo_record_id = ?", disciplina.deporte_id, disciplina.id , idOlimp).first_or_create( :evento_id => @evento.id, :marca => (disciplina.tipo_escala_id == TipoEscala.where('tipo_escala = ?','Asc').first.id ? 0 : 9999999) )
    rrM = RegistroRecord.where("deporte_id = ? AND disciplina_id = ? AND tipo_record_id = ?", disciplina.deporte_id, disciplina.id , idMundial).first_or_create( :evento_id => @evento.id, :marca => (disciplina.tipo_escala_id == TipoEscala.where('tipo_escala = ?','Asc').first.id ? 0 : 9999999) )
      
    if disciplina.jugadoresPorEquipo == 1
      je = JugadoresEventos.find(params[:id])
      rr.jugador_id = je.jugadore_id
      rrM.jugador_id = je.jugadore_id
      
    else
      je = EquipoEvento.find(params[:id])
      rr.equipo_id = je.equipo_id
      rrM.equipo_id = je.equipo_id
    end
    
      je.marca = params[:format] ? params[:marca]+'.'+ params[:format] : params[:marca]

    je.save


##actualizar registros
      if rr.marca.nil?  | ( (je.marca > rr.marca) & (disciplina.tipo_escala_id == TipoEscala.where('tipo_escalas.tipo_escala = ?','Asc').first.id) )| ((je.marca < rr.marca) & (disciplina.tipo_escala_id == TipoEscala.where('tipo_escalas.tipo_escala = ?', 'Desc').first.id ) )
        rr.marca = je.marca
        rr.evento_id = @evento.id
        rr.deporte_id = disciplina.deporte_id
        rr.disciplina_id = disciplina.id
        rr.tipo_record_id = idOlimp
        rr.save
      end
      if rrM.marca.nil?  | ( (je.marca > rrM.marca) & (disciplina.tipo_escala_id == TipoEscala.where('tipo_escalas.tipo_escala = ?','Asc').first.id) )| ((je.marca < rrM.marca) & (disciplina.tipo_escala_id == TipoEscala.where('tipo_escalas.tipo_escala = ?', 'Desc').first.id ) )
        rrM.marca = je.marca
        rrM.evento_id = @evento.id
        rrM.deporte_id = disciplina.deporte_id
        rrM.disciplina_id = disciplina.id
        rrM.tipo_record_id = idMundial
        rrM.save
      end


      redirect_to @evento

  
  end


 def mundial
  rr1 = RegistroRecord.new
  rr1.tipo_record = 'Olimpico'
  rr1.save

  rr2 = RegistroRecord.new
  rr2.tipo_record = 'Mundial'
  rr2.save
@evento = Evento.all.first 

redirect_to @evento
 end



end
