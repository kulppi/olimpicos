class DeportesController < ApplicationController
  # GET /deportes
  # GET /deportes.json
  def index
    @deportes = Deporte.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deportes }
    end
  end

  # GET /deportes/1
  # GET /deportes/1.json
  def show
    @deporte = Deporte.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deporte }
    end
  end

  # GET /deportes/new
  # GET /deportes/new.json
  def new
    @deporte = Deporte.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deporte }
    end
  end

  # GET /deportes/1/edit
  def edit
    @deporte = Deporte.find(params[:id])
  end

  # POST /deportes
  # POST /deportes.json
  def create
    @deporte = Deporte.new(params[:deporte])



    respond_to do |format|
      if @deporte.save
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @deporte.id
    newAuditoria.save
        format.html { redirect_to @deporte, notice: 'Deporte was successfully created.' }
        format.json { render json: @deporte, status: :created, location: @deporte }
      else
        format.html { render action: "new" }
        format.json { render json: @deporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deportes/1
  # PUT /deportes/1.json
  def update
    @deporte = Deporte.find(params[:id])

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @deporte.id
    newAuditoria.save
    

    respond_to do |format|
      if @deporte.update_attributes(params[:deporte])
        format.html { redirect_to @deporte, notice: 'Deporte was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deportes/1
  # DELETE /deportes/1.json
  def destroy
    @deporte = Deporte.find(params[:id])
    
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @deporte.id
    newAuditoria.save
    
    @deporte.destroy

    respond_to do |format|
      format.html { redirect_to deportes_url }
      format.json { head :no_content }
    end
  end
end
