class OlimpiadasController < ApplicationController
  # GET /olimpiadas
  # GET /olimpiadas.json
  def index
    @olimpiadas = Olimpiada.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @olimpiadas }
    end
  end

  # GET /olimpiadas/1
  # GET /olimpiadas/1.json
  def show
    @olimpiada = Olimpiada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @olimpiada }
    end
  end

  # GET /olimpiadas/new
  # GET /olimpiadas/new.json
  def new
    @olimpiada = Olimpiada.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @olimpiada }
    end
  end

  # GET /olimpiadas/1/edit
  def edit
    @olimpiada = Olimpiada.find(params[:id])
  end

  # POST /olimpiadas
  # POST /olimpiadas.json
  def create
    @olimpiada = Olimpiada.new(params[:olimpiada])

    respond_to do |format|
      if @olimpiada.save

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @olimpiada.id
    newAuditoria.save
        format.html { redirect_to @olimpiada, notice: 'Olimpiada was successfully created.' }
        format.json { render json: @olimpiada, status: :created, location: @olimpiada }
      else
        format.html { render action: "new" }
        format.json { render json: @olimpiada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /olimpiadas/1
  # PUT /olimpiadas/1.json
  def update
    @olimpiada = Olimpiada.find(params[:id])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @olimpiada.id
    newAuditoria.save

    respond_to do |format|
      if @olimpiada.update_attributes(params[:olimpiada])
        format.html { redirect_to @olimpiada, notice: 'Olimpiada was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @olimpiada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /olimpiadas/1
  # DELETE /olimpiadas/1.json
  def destroy
    @olimpiada = Olimpiada.find(params[:id])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @olimpiada.id
    newAuditoria.save
    @olimpiada.destroy

    respond_to do |format|
      format.html { redirect_to olimpiadas_url }
      format.json { head :no_content }
    end
  end
end
