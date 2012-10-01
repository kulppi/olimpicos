class DelegacionesController < ApplicationController
  # GET /delegaciones
  # GET /delegaciones.json
  def index
    @delegaciones = Delegacione.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @delegaciones }
    end
  end

  # GET /delegaciones/1
  # GET /delegaciones/1.json
  def show
    @delegacione = Delegacione.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delegacione }
    end
  end

  # GET /delegaciones/new
  # GET /delegaciones/new.json
  def new
    @delegacione = Delegacione.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delegacione }
    end
  end

  # GET /delegaciones/1/edit
  def edit
    @delegacione = Delegacione.find(params[:id])
  end

  # POST /delegaciones
  # POST /delegaciones.json
  def create
    @delegacione = Delegacione.new(params[:delegacione])


    respond_to do |format|
      if @delegacione.save
    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @delegacione.id
    newAuditoria.save
        format.html { redirect_to @delegacione, notice: 'Delegacione was successfully created.' }
        format.json { render json: @delegacione, status: :created, location: @delegacione }
      else
        format.html { render action: "new" }
        format.json { render json: @delegacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /delegaciones/1
  # PUT /delegaciones/1.json
  def update
    @delegacione = Delegacione.find(params[:id])

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @delegacione.id
    newAuditoria.save

    respond_to do |format|
      if @delegacione.update_attributes(params[:delegacione])
        format.html { redirect_to @delegacione, notice: 'Delegacione was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delegacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delegaciones/1
  # DELETE /delegaciones/1.json
  def destroy
    @delegacione = Delegacione.find(params[:id])

    newAuditoria = Auditoria.new
    newAuditoria.tabla = params[:controller]
    newAuditoria.action = params[:action]
    newAuditoria.usuario =  User.all.first.id
    newAuditoria.clave = @delegacione.id
    newAuditoria.save
    
    @delegacione.destroy

    respond_to do |format|
      format.html { redirect_to delegaciones_url }
      format.json { head :no_content }
    end
  end
end
