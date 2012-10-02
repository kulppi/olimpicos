class JugadoresController < ApplicationController
  # GET /jugadores
  # GET /jugadores.json
  def index
    @jugadores = Jugadore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jugadores }
    end
  end

  # GET /jugadores/1
  # GET /jugadores/1.json
  def show
    @jugadore = Jugadore.find(params[:id])

     query = Disciplina.joins(' JOIN jugadores_disciplinas ON jugadores_disciplinas.disciplina_id = disciplinas.id').where('jugadores_disciplinas.jugadore_id = ?' , @jugadore.id )
      @disIn = query.all
      @dis = Disciplina.where('disciplinas.id NOT IN (?)' , query.select('disciplinas.id').empty? ? [0] : query.select('disciplinas.id').all  ).all


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jugadore }
    end
  end

  # GET /jugadores/new
  # GET /jugadores/new.json
  def new
    @jugadore = Jugadore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jugadore }
    end
  end

  # GET /jugadores/1/edit
  def edit
    @jugadore = Jugadore.find(params[:id])
  end

  # POST /jugadores
  # POST /jugadores.json
  def create
    @jugadore = Jugadore.new(params[:jugadore])

    respond_to do |format|
      if @jugadore.save
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @jugadore.id
    newAuditoria.save
        format.html { redirect_to @jugadore, notice: 'Jugadore was successfully created.' }
        format.json { render json: @jugadore, status: :created, location: @jugadore }
      else
        format.html { render action: "new" }
        format.json { render json: @jugadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jugadores/1
  # PUT /jugadores/1.json
  def update
    @jugadore = Jugadore.find(params[:id])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @jugadore.id
    newAuditoria.save

    respond_to do |format|
      if @jugadore.update_attributes(params[:jugadore])
        format.html { redirect_to @jugadore, notice: 'Jugadore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jugadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jugadores/1
  # DELETE /jugadores/1.json
  def destroy
    @jugadore = Jugadore.find(params[:id])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @jugadore.id
    newAuditoria.save


    JugadoresEquipos.where('jugadores_equipos.jugadore_id = ?', @jugadore.id).each do |y|

      y.destroy
    end
    JugadoresEventos.where('jugadores_eventos.jugadore_id = ?', @jugadore.id).each do |y|

      y.destroy
    end
    JugadoresDisciplinas.where('jugadores_disciplinas.jugadore_id = ?', @jugadore.id).each do |y|

      y.destroy
    end
    @jugadore.delete

    respond_to do |format|
      format.html { redirect_to jugadores_url }
      format.json { head :no_content }
    end
  end

  def add

    @jugadore = Jugadore.find(params[:jugadores])
    je = JugadoresDisciplinas.new
    je.jugadore_id = params[:jugadores]
    je.disciplina_id = params[:disciplina]
    je.save

    redirect_to @jugadore


  end

  def remove

    je = JugadoresDisciplinas.find(params[:id])
    @jugadore = Jugadore.find(je.jugadore_id)
    je.destroy
    redirect_to @jugadore


  end




end
