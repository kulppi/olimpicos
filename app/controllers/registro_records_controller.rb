class RegistroRecordsController < ApplicationController
  # GET /registro_records
  # GET /registro_records.json
  def index
    @registro_records = RegistroRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registro_records }
    end
  end

  # GET /registro_records/1
  # GET /registro_records/1.json
  def show
    @registro_record = RegistroRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registro_record }
    end
  end

  # GET /registro_records/new
  # GET /registro_records/new.json
  def new
    @registro_record = RegistroRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registro_record }
    end
  end

  # GET /registro_records/1/edit
  def edit
    @registro_record = RegistroRecord.find(params[:id])
  end

  # POST /registro_records
  # POST /registro_records.json
  def create
    @registro_record = RegistroRecord.new(params[:registro_record])

    respond_to do |format|
      if @registro_record.save
        format.html { redirect_to @registro_record, notice: 'Registro record was successfully created.' }
        format.json { render json: @registro_record, status: :created, location: @registro_record }
      else
        format.html { render action: "new" }
        format.json { render json: @registro_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registro_records/1
  # PUT /registro_records/1.json
  def update
    @registro_record = RegistroRecord.find(params[:id])

    respond_to do |format|
      if @registro_record.update_attributes(params[:registro_record])
        format.html { redirect_to @registro_record, notice: 'Registro record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registro_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registro_records/1
  # DELETE /registro_records/1.json
  def destroy
    @registro_record = RegistroRecord.find(params[:id])
    @registro_record.destroy

    respond_to do |format|
      format.html { redirect_to registro_records_url }
      format.json { head :no_content }
    end
  end
end
