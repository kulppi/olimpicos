class SectoresController < ApplicationController
  # GET /sectores
  # GET /sectores.json
  def index
    @sectores = Sectore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sectores }
    end
  end

  # GET /sectores/1
  # GET /sectores/1.json
  def show
    @sectore = Sectore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sectore }
    end
  end

  # GET /sectores/new
  # GET /sectores/new.json
  def new
    @sectore = Sectore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sectore }
    end
  end

  # GET /sectores/1/edit
  def edit
    @sectore = Sectore.find(params[:id])
  end

  # POST /sectores
  # POST /sectores.json
  def create
    @sectore = Sectore.new(params[:sectore])

    respond_to do |format|
      if @sectore.save
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @sectore.id
    newAuditoria.save
        format.html { redirect_to @sectore, notice: 'Sectore was successfully created.' }
        format.json { render json: @sectore, status: :created, location: @sectore }
      else
        format.html { render action: "new" }
        format.json { render json: @sectore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sectores/1
  # PUT /sectores/1.json
  def update
    @sectore = Sectore.find(params[:id])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @sectore.id
    newAuditoria.save

    respond_to do |format|
      if @sectore.update_attributes(params[:sectore])
        format.html { redirect_to @sectore, notice: 'Sectore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sectore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectores/1
  # DELETE /sectores/1.json
  def destroy
    @sectore = Sectore.find(params[:id])
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @sectore.id
    newAuditoria.save
    @sectore.destroy

    respond_to do |format|
      format.html { redirect_to sectores_url }
      format.json { head :no_content }
    end
  end
end
