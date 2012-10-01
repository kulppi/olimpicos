class EntrenadoresController < ApplicationController
  # GET /entrenadores
  # GET /entrenadores.json
  def index
    @entrenadores = Entrenadore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entrenadores }
    end
  end

  # GET /entrenadores/1
  # GET /entrenadores/1.json
  def show
    @entrenadore = Entrenadore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entrenadore }
    end
  end

  # GET /entrenadores/new
  # GET /entrenadores/new.json
  def new
    @entrenadore = Entrenadore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entrenadore }
    end
  end

  # GET /entrenadores/1/edit
  def edit
    @entrenadore = Entrenadore.find(params[:id])
  end

  # POST /entrenadores
  # POST /entrenadores.json
  def create
    @entrenadore = Entrenadore.new(params[:entrenadore])


    respond_to do |format|
      if @entrenadore.save
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @entrenadore.id
    newAuditoria.save
        format.html { redirect_to @entrenadore, notice: 'Entrenadore was successfully created.' }
        format.json { render json: @entrenadore, status: :created, location: @entrenadore }
      else
        format.html { render action: "new" }
        format.json { render json: @entrenadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entrenadores/1
  # PUT /entrenadores/1.json
  def update
    @entrenadore = Entrenadore.find(params[:id])

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @entrenadore.id
    newAuditoria.save

    respond_to do |format|
      if @entrenadore.update_attributes(params[:entrenadore])
        format.html { redirect_to @entrenadore, notice: 'Entrenadore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entrenadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrenadores/1
  # DELETE /entrenadores/1.json
  def destroy
    @entrenadore = Entrenadore.find(params[:id])

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @entrenadore.id
    newAuditoria.save
    
    @entrenadore.destroy

    respond_to do |format|
      format.html { redirect_to entrenadores_url }
      format.json { head :no_content }
    end
  end
end
